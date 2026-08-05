// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'police_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PoliceStation _$PoliceStationFromJson(Map<String, dynamic> json) {
  return _PoliceStation.fromJson(json);
}

/// @nodoc
mixin _$PoliceStation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this PoliceStation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoliceStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoliceStationCopyWith<PoliceStation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoliceStationCopyWith<$Res> {
  factory $PoliceStationCopyWith(
    PoliceStation value,
    $Res Function(PoliceStation) then,
  ) = _$PoliceStationCopyWithImpl<$Res, PoliceStation>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String phone,
    String locationId,
  });
}

/// @nodoc
class _$PoliceStationCopyWithImpl<$Res, $Val extends PoliceStation>
    implements $PoliceStationCopyWith<$Res> {
  _$PoliceStationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoliceStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? locationId = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            locationId: null == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PoliceStationImplCopyWith<$Res>
    implements $PoliceStationCopyWith<$Res> {
  factory _$$PoliceStationImplCopyWith(
    _$PoliceStationImpl value,
    $Res Function(_$PoliceStationImpl) then,
  ) = __$$PoliceStationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String phone,
    String locationId,
  });
}

/// @nodoc
class __$$PoliceStationImplCopyWithImpl<$Res>
    extends _$PoliceStationCopyWithImpl<$Res, _$PoliceStationImpl>
    implements _$$PoliceStationImplCopyWith<$Res> {
  __$$PoliceStationImplCopyWithImpl(
    _$PoliceStationImpl _value,
    $Res Function(_$PoliceStationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PoliceStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? locationId = null,
  }) {
    return _then(
      _$PoliceStationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: null == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PoliceStationImpl implements _PoliceStation {
  const _$PoliceStationImpl({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.locationId,
  });

  factory _$PoliceStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoliceStationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String phone;
  @override
  final String locationId;

  @override
  String toString() {
    return 'PoliceStation(id: $id, name: $name, address: $address, phone: $phone, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoliceStationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, phone, locationId);

  /// Create a copy of PoliceStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoliceStationImplCopyWith<_$PoliceStationImpl> get copyWith =>
      __$$PoliceStationImplCopyWithImpl<_$PoliceStationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoliceStationImplToJson(this);
  }
}

abstract class _PoliceStation implements PoliceStation {
  const factory _PoliceStation({
    required final String id,
    required final String name,
    required final String address,
    required final String phone,
    required final String locationId,
  }) = _$PoliceStationImpl;

  factory _PoliceStation.fromJson(Map<String, dynamic> json) =
      _$PoliceStationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get phone;
  @override
  String get locationId;

  /// Create a copy of PoliceStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoliceStationImplCopyWith<_$PoliceStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
