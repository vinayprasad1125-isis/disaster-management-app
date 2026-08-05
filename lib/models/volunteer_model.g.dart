// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VolunteerImpl _$$VolunteerImplFromJson(Map<String, dynamic> json) =>
    _$VolunteerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      availability: json['availability'] as String,
      locationId: json['locationId'] as String,
    );

Map<String, dynamic> _$$VolunteerImplToJson(_$VolunteerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'skills': instance.skills,
      'availability': instance.availability,
      'locationId': instance.locationId,
    };
