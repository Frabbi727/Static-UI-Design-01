import 'dart:convert';
PostApiData postApiDataFromJson(String str) => PostApiData.fromJson(json.decode(str));
String postApiDataToJson(PostApiData data) => json.encode(data.toJson());
class PostApiData {
  PostApiData({
      this.name, 
      this.job, 
      this.id, 
      this.createdAt,});

  PostApiData.fromJson(dynamic json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }
  String? name;
  String? job;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['job'] = job;
    map['id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

}