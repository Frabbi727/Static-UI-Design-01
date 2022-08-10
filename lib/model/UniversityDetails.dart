import 'dart:convert';
UniversityDetails universityDetailsFromJson(String str) => UniversityDetails.fromJson(json.decode(str));
String universityDetailsToJson(UniversityDetails data) => json.encode(data.toJson());
class UniversityDetails {
  UniversityDetails({
      this.webPages, 
      this.stateprovince, 
      this.alphaTwoCode, 
      this.domains, 
      this.country, 
      this.name,});

  UniversityDetails.fromJson(dynamic json) {
    webPages = json['web_pages'] != null ? json['web_pages'].cast<String>() : [];
    stateprovince = json['state-province'];
    alphaTwoCode = json['alpha_two_code'];
    domains = json['domains'] != null ? json['domains'].cast<String>() : [];
    country = json['country'];
    name = json['name'];
  }
  List<String>? webPages;
  dynamic stateprovince;
  String? alphaTwoCode;
  List<String>? domains;
  String? country;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['web_pages'] = webPages;
    map['state-province'] = stateprovince;
    map['alpha_two_code'] = alphaTwoCode;
    map['domains'] = domains;
    map['country'] = country;
    map['name'] = name;
    return map;
  }

}