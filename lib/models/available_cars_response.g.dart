// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableCarsResponse _$AvailableCarsResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableCarsResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableCarsResponseToJson(
        AvailableCarsResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
