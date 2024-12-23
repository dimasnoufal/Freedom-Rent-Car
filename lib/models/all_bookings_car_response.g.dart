// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_bookings_car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBookingsCarResponse _$AllBookingsCarResponseFromJson(
        Map<String, dynamic> json) =>
    AllBookingsCarResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datumzz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllBookingsCarResponseToJson(
        AllBookingsCarResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
