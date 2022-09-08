

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bloc.dart';
import 'package:untitled/bloc/event.dart';
import 'package:untitled/bloc/state.dart';
import 'package:untitled/data/request/city_list_request.dart';
import 'package:untitled/data/response/city_list_response.dart';
import 'package:untitled/loader_skeleton.dart';

class CityListScreen extends StatefulWidget {
  final String stateId;
  const CityListScreen({Key? key,required this.stateId}) : super(key: key);

  @override
  _CityListScreenState createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {

  late ManagerBloc managerBloc;
  List<CityResult>? cityList;
  bool isLoading=true;

  @override
  void initState() {
    managerBloc = BlocProvider.of<ManagerBloc>(context);
    managerBloc.add(GetCityListEvent(cityListRequest:CityListRequest(stateID: widget.stateId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener(
          bloc: managerBloc,
          listener: (BuildContext context, state) {
            if(state is GetCityListState){
              cityList=CityListResponse.fromJson(jsonDecode(state.apiResponse!.dataResponse)).result;
              isLoading=false;
            }
        },
        child: BlocBuilder(
          bloc: managerBloc,
          builder: (BuildContext context, state) {
            return ScreenWithLoader(
              isLoading: isLoading,
              body: cityList==null ? Container() : SingleChildScrollView(
                child: Column(
                  children: cityList!.map((e){
                    return getCityName(e);
                  }).toList(),
                ),
              ),
            );
          },),),
      ),
    );
  }

  Widget getCityName(CityResult result) {
    return Container(
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
    );
  }
}
