// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      totalRecords: BaseResponse.totalFromPagination(
          json['pagination'] as Map<String, dynamic>?),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      error: json['error'] == null
          ? null
          : BaseResponseError.fromJson(json['error'] as Map<String, dynamic>),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

BaseResponseError _$BaseResponseErrorFromJson(Map<String, dynamic> json) =>
    BaseResponseError(
      stack: json['stack'] as String?,
      message: json['message'] as String?,
    );
