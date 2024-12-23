// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingByIdResponse _$BookingByIdResponseFromJson(Map<String, dynamic> json) =>
    BookingByIdResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datumss.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingByIdResponseToJson(
        BookingByIdResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
