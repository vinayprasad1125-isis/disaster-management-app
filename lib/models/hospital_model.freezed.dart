// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this Hospital to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res, Hospital>;
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
class _$HospitalCopyWithImpl<$Res, $Val extends Hospital>
    implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hospital
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
abstract class _$$HospitalImplCopyWith<$Res>
    implements $HospitalCopyWith<$Res> {
  factory _$$HospitalImplCopyWith(
    _$HospitalImpl value,
    $Res Function(_$HospitalImpl) then,
  ) = __$$HospitalImplCopyWithImpl<$Res>;
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
class __$$HospitalImplCopyWithImpl<$Res>
    extends _$HospitalCopyWithImpl<$Res, _$HospitalImpl>
    implements _$$HospitalImplCopyWith<$Res> {
  __$$HospitalImplCopyWithImpl(
    _$HospitalImpl _value,
    $Res Function(_$HospitalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Hospital
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
      _$HospitalImpl(
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
class _$HospitalImpl implements _Hospital {
  const _$HospitalImpl({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.locationId,
  });

  factory _$HospitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalImplFromJson(json);

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
    return 'Hospital(id: $id, name: $name, address: $address, phone: $phone, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalImpl &&
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

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      __$$HospitalImplCopyWithImpl<_$HospitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalImplToJson(this);
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital({
    required final String id,
    required final String name,
    required final String address,
    required final String phone,
    required final String locationId,
  }) = _$HospitalImpl;

  factory _Hospital.fromJson(Map<String, dynamic> json) =
      _$HospitalImpl.fromJson;

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

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
