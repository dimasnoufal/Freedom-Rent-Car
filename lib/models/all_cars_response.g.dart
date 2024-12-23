// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCarsResponse _$AllCarsResponseFromJson(Map<String, dynamic> json) =>
    AllCarsResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datumz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCarsResponseToJson(AllCarsResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
