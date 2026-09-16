// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShelterImpl _$$ShelterImplFromJson(Map<String, dynamic> json) =>
    _$ShelterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      capacity: (json['capacity'] as num).toInt(),
      availableBeds: (json['availableBeds'] as num).toInt(),
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$ShelterImplToJson(_$ShelterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'capacity': instance.capacity,
      'availableBeds': instance.availableBeds,
      'locationId': instance.locationId,
    };
