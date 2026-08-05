// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FireStationImpl _$$FireStationImplFromJson(Map<String, dynamic> json) =>
    _$FireStationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$FireStationImplToJson(_$FireStationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'locationId': instance.locationId,
    };
