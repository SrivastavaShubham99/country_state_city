import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bloc.dart';
import 'package:untitled/bloc/event.dart';
import 'package:untitled/bloc/state.dart';
import 'package:untitled/data/request/state_list_request.dart';
import 'package:untitled/data/response/country_list_response.dart';
import 'package:untitled/data/response/state_list_response.dart';
import 'package:untitled/loader_skeleton.dart';
import 'package:untitled/ui/city_list_screen.dart';

class StateListScreen extends StatefulWidget {
  final countryId;
  const StateListScreen({Key? key, required this.countryId}) : super(key: key);

  @override
  _StateListScreenState createState() => _StateListScreenState();
}

class _StateListScreenState extends State<StateListScreen> {
  late ManagerBloc managerBloc;
  List<StateResult>? stateListResult;
  bool isLoading = true;

  @override
  void initState() {
    managerBloc = BlocProvider.of<ManagerBloc>(context);
    managerBloc.add(GetStateListEvent(
        stateListRequest:
            StateListRequest(countryID: widget.countryId.toString())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener(
      bloc: managerBloc,
      listener: (BuildContext context, state) {
        if (state is GetStateListState) {
          print("state list events -> ${state.apiResponse!.dataResponse}");
          stateListResult = StateListResponse.fromJson(
                  jsonDecode(state.apiResponse!.dataResponse))
              .result;
          isLoading = false;
        }
      },
      child: BlocBuilder(
        bloc: managerBloc,
        builder: (BuildContext context, state) {
          return ScreenWithLoader(
            isLoading: isLoading,
            body: stateListResult == null
                ? Container()
                : SingleChildScrollView(
                  child: Column(
                      children: stateListResult!.map((e) {
                        return getStateName(e);
                      }).toList(),
                    ),
                ),
          );
        },
      ),
    ));
  }

  Widget getStateName(StateResult result) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  CityListScreen(stateId: result.iD.toString())),
        );
      },
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.lightGreen[200]),
        child: Center(
          child: Text(
            result.name!,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
