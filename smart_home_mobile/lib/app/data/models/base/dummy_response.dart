import 'base_data_response.dart';

class DummyResponse extends BaseDataResponse {
  CountriesRoute? countriesRoute;

  DummyResponse({this.countriesRoute});

  DummyResponse.fromJson(Map<String, dynamic> json) {
    countriesRoute = json['countriesRoute'] != null
        ? new CountriesRoute.fromJson(json['countriesRoute'])
        : null;
  }
}

class CountriesRoute {
  late String name;
  late String description;
  late String path;

  CountriesRoute({this.name = "", this.description = "", this.path = ""});

  CountriesRoute.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Path'] = this.path;
    return data;
  }
}
