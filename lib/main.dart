import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bloc.dart';
import 'package:untitled/data/response/country_list_response.dart';
import 'package:untitled/ui/city_list_screen.dart';
import 'package:untitled/ui/country_list_screen.dart';

import 'bloc/state.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ManagerBloc>(
            create: (BuildContext context) =>
                ManagerBloc(BlocInitials())),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountryListScreen(),
    );
  }

}


