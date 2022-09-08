

class CountryListResponse {
  Error? error;
  List<Result>? result;

  CountryListResponse({this.error, this.result});

  CountryListResponse.fromJson(Map<String, dynamic> json) {
    error = json['Error'] != null ? new Error.fromJson(json['Error']) : null;
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['Error'] = this.error!.toJson();
    }
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Error {
  String? errorCode;
  String? errorMessage;

  Error({this.errorCode, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}

class Result {
  int? countryID;
  String? countryCode;
  String? countryName;

  Result({this.countryID, this.countryCode, this.countryName});

  Result.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
    countryCode = json['CountryCode'];
    countryName = json['CountryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CountryID'] = this.countryID;
    data['CountryCode'] = this.countryCode;
    data['CountryName'] = this.countryName;
    return data;
  }
}