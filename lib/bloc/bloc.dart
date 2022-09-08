

import 'package:bloc/bloc.dart';

import 'package:untitled/bloc/state.dart';

import '../repository.dart';
import 'event.dart';

class ManagerBloc extends Bloc<BaseEvent,BaseState>{
  ManagerBloc(BaseState initialState) : super(initialState){
    on<GetCountryListEvent>(_handleTimingSlot);
    on<GetStateListEvent>(_handleStateList);
    on<GetCityListEvent>(_handleCityList);
  }

  _handleTimingSlot(GetCountryListEvent event,Emitter<BaseState> emit) async{
    final repository=Repository();
    final response=await repository.getCountryList();
    emit(GetCountryListState(apiResponse: response));
  }

  _handleStateList(GetStateListEvent event,Emitter<BaseState> emit) async{
    final repository=Repository();
    final response=await repository.getStateList(event.stateListRequest!);
    emit(GetStateListState(apiResponse: response));
  }

  _handleCityList(GetCityListEvent event,Emitter<BaseState> emit) async{
    final repository=Repository();
    final response=await repository.getCityList(event.cityListRequest!);
    emit(GetCityListState(apiResponse: response));
  }

}