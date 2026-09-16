// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userId: json['userId'] as String,
      phoneNumber: json['phoneNumber'] as String,
      bloodGroup: json['bloodGroup'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'bloodGroup': instance.bloodGroup,
      'address': instance.address,
    };
