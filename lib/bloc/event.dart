


import 'package:untitled/data/request/city_list_request.dart';
import 'package:untitled/data/request/state_list_request.dart';

abstract class BaseEvent{}

class GetCountryListEvent extends BaseEvent{
  GetCountryListEvent();
}


class GetStateListEvent extends BaseEvent{
  StateListRequest? stateListRequest;
  GetStateListEvent({required this.stateListRequest});
}

class GetCityListEvent extends BaseEvent{
  CityListRequest? cityListRequest;
  GetCityListEvent({required this.cityListRequest});
}

