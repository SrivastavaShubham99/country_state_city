

class StateListRequest {
  String? countryID;

  StateListRequest({this.countryID});

  StateListRequest.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CountryID'] = this.countryID;
    return data;
  }
}