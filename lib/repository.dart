

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:untitled/data/request/city_list_request.dart';
import 'package:untitled/data/request/state_list_request.dart';

import 'api_response.dart';
import 'api_service.dart';

class Repository {
  ApiService? apiService;
  Repository() {
    apiService = ApiService();
  }

  Future<ApiResponse> getCountryList() async {
    try {
      final response = await apiService?.dio.get(
        "CountryList/",
          options: Options(
            responseType: ResponseType.json,
            contentType: "application/json",
            headers: {
              "Api-Token" : "sr7It@y+2lcView"
            }
          ),
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response.data);
      } else {
        return ApiResponse.error(response.data);
      }
    } on DioError catch (e) {
      log("here is the exception -> $e");
      if (e.response?.statusCode == 400) {
        return ApiResponse.failure(e.response?.data);
      }
      return ApiResponse.failure(e.response?.data);
    }
  }

  Future<ApiResponse> getStateList(StateListRequest stateListRequest) async {
    try {
      final response = await apiService?.dio.post(
        "StateList/",
        options: Options(
            responseType: ResponseType.json,
            contentType: "application/json",
            headers: {
              "Api-Token" : "sr7It@y+2lcView"
            }
        ),
        data: json.encode(stateListRequest.toJson()),
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response.data);
      } else {
        return ApiResponse.error(response.data);
      }
    } on DioError catch (e) {
      log("here is the exception -> $e");
      if (e.response?.statusCode == 400) {
        return ApiResponse.failure(e.response?.data);
      }
      return ApiResponse.failure(e.response?.data);
    }
  }

  Future<ApiResponse> getCityList(CityListRequest  cityListRequest) async {
    try {
      final response = await apiService?.dio.post(
        "CityList/",
        options: Options(
            responseType: ResponseType.json,
            contentType: "application/json",
            headers: {
              "Api-Token" : "sr7It@y+2lcView"
            }
        ),
        data: json.encode(cityListRequest.toJson()),
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response.data);
      } else {
        return ApiResponse.error(response.data);
      }
    } on DioError catch (e) {
      log("here is the exception -> $e");
      if (e.response?.statusCode == 400) {
        return ApiResponse.failure(e.response?.data);
      }
      return ApiResponse.failure(e.response?.data);
    }
  }


}