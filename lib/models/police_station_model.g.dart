// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'police_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoliceStationImpl _$$PoliceStationImplFromJson(Map<String, dynamic> json) =>
    _$PoliceStationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$PoliceStationImplToJson(_$PoliceStationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'locationId': instance.locationId,
    };
