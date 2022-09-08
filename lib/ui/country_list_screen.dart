

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bloc.dart';
import 'package:untitled/bloc/event.dart';
import 'package:untitled/bloc/state.dart';
import 'package:untitled/data/response/country_list_response.dart';
import 'package:untitled/loader_skeleton.dart';
import 'package:untitled/ui/state_list_screen.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {

  late ManagerBloc managerBloc;
  List<Result>? countryListResult;
  bool isLoading=true;

  @override
  void initState() {
    managerBloc=BlocProvider.of<ManagerBloc>(context);
    managerBloc.add(GetCountryListEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener(
          bloc: managerBloc,
          listener: (BuildContext context, state) {
            if(state is GetCountryListState){
              print("list response from srver -> ${state.apiResponse!.dataResponse}");
              if(state.apiResponse!.dataResponse!=null){
                countryListResult=CountryListResponse.fromJson(jsonDecode(state.apiResponse!.dataResponse)).result;
              }

              isLoading=false;
            }
          },
          child: BlocBuilder(
            bloc: managerBloc,
            builder: (BuildContext context, state) {
              return ScreenWithLoader(
                isLoading: isLoading,
                body: countryListResult!=null ? SingleChildScrollView(
                  child: Column(
                    children: countryListResult!.map((e){
                      return getCountryName(e);
                    }).toList(),
                  ),
                ) : Center(
                    child: Text("loading")),
              );
          },),
        ),
      ),
    );
  }


  Widget getCountryName(Result result){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  StateListScreen(countryId: result.countryID)),
        );
      },
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.lightGreen[200]
        ),
        child: Center(
          child: Text(result.countryName?? "",style: const TextStyle(
              color: Colors.black
          ),),
        ),
      ),
    );
  }
}
