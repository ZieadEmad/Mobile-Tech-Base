import "package:json_annotation/json_annotation.dart";
part 'base_response.g.dart';
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  @JsonKey(name: 'pagination', fromJson: totalFromPagination)
  final int? totalRecords;
  final T? data;
  final BaseResponseError? error;

  BaseResponse({this.totalRecords, this.data, this.error});

  static int totalFromPagination(Map<String, dynamic>? json) =>
      json == null ? 0 : json['total'];

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class BaseResponseError {
  final String? message;
  final String? stack;

  BaseResponseError({required this.stack, required this.message});

  factory BaseResponseError.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseErrorFromJson(json);
}
