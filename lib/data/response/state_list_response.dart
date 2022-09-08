

class StateListResponse {
  Error? error;
  List<StateResult>? result;

  StateListResponse({this.error, this.result});

  StateListResponse.fromJson(Map<String, dynamic> json) {
    error = json['Error'] != null ? new Error.fromJson(json['Error']) : null;
    if (json['Result'] != null) {
      result = <StateResult>[];
      json['Result'].forEach((v) {
        result!.add(new StateResult.fromJson(v));
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

class StateResult {
  int? iD;
  String? name;

  StateResult({this.iD, this.name});

  StateResult.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    return data;
  }
}