// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalImpl _$$HospitalImplFromJson(Map<String, dynamic> json) =>
    _$HospitalImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$HospitalImplToJson(_$HospitalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'locationId': instance.locationId,
    };
