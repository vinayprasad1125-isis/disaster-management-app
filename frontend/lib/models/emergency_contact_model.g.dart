// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyContactImpl _$$EmergencyContactImplFromJson(
  Map<String, dynamic> json,
) => _$EmergencyContactImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  relationship: json['relationship'] as String,
);

Map<String, dynamic> _$$EmergencyContactImplToJson(
  _$EmergencyContactImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'relationship': instance.relationship,
};
