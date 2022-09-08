

import '../api_response.dart';

abstract class BaseState{}

class BlocInitials extends BaseState{}

class GetCountryListState extends BaseState{
  ApiResponse? apiResponse;
  GetCountryListState({this.apiResponse});
}

class GetStateListState extends BaseState{
  ApiResponse? apiResponse;
  GetStateListState({this.apiResponse});
}

class GetCityListState extends BaseState{
  ApiResponse? apiResponse;
  GetCityListState({this.apiResponse});
}