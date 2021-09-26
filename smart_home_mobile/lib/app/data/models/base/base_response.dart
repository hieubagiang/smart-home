import 'dart:convert';

class BaseResponse<T> {
  BaseResponse(
      {this.isSuccess = false, this.data, this.result = false, this.codeHttp});

  // MetaResponse? metaData;
  bool result;
  int? status;
  bool isSuccess;
  int? codeHttp;
  T? data;

  factory BaseResponse.fromJson(String str) =>
      BaseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
      // metaData:
      //     json["meta"] == null ? null : MetaResponse.fromJson(json["meta"]),
      result: json["result"],
      data: json["data"]);

  Map<String, dynamic> toMap() => {
        // "meta": metaData == null ? null : metaData,
      };
}
