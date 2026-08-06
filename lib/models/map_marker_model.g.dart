// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapMarkerImpl _$$MapMarkerImplFromJson(Map<String, dynamic> json) =>
    _$MapMarkerImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      locationId: json['locationId'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$MapMarkerImplToJson(_$MapMarkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'locationId': instance.locationId,
      'lat': instance.lat,
      'lng': instance.lng,
    };
