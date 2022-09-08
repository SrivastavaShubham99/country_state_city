

class CityListRequest {
  String? stateID;

  CityListRequest({this.stateID});

  CityListRequest.fromJson(Map<String, dynamic> json) {
    stateID = json['StateID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StateID'] = this.stateID;
    return data;
  }
}