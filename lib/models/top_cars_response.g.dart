// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCarsResponse _$TopCarsResponseFromJson(Map<String, dynamic> json) =>
    TopCarsResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datums.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopCarsResponseToJson(TopCarsResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
