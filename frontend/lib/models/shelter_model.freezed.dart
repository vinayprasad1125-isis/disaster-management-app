// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Shelter _$ShelterFromJson(Map<String, dynamic> json) {
  return _Shelter.fromJson(json);
}

/// @nodoc
mixin _$Shelter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  int get availableBeds => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this Shelter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterCopyWith<Shelter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterCopyWith<$Res> {
  factory $ShelterCopyWith(Shelter value, $Res Function(Shelter) then) =
      _$ShelterCopyWithImpl<$Res, Shelter>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    int capacity,
    int availableBeds,
    String locationId,
  });
}

/// @nodoc
class _$ShelterCopyWithImpl<$Res, $Val extends Shelter>
    implements $ShelterCopyWith<$Res> {
  _$ShelterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? capacity = null,
    Object? availableBeds = null,
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
            capacity: null == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int,
            availableBeds: null == availableBeds
                ? _value.availableBeds
                : availableBeds // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$ShelterImplCopyWith<$Res> implements $ShelterCopyWith<$Res> {
  factory _$$ShelterImplCopyWith(
    _$ShelterImpl value,
    $Res Function(_$ShelterImpl) then,
  ) = __$$ShelterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    int capacity,
    int availableBeds,
    String locationId,
  });
}

/// @nodoc
class __$$ShelterImplCopyWithImpl<$Res>
    extends _$ShelterCopyWithImpl<$Res, _$ShelterImpl>
    implements _$$ShelterImplCopyWith<$Res> {
  __$$ShelterImplCopyWithImpl(
    _$ShelterImpl _value,
    $Res Function(_$ShelterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? capacity = null,
    Object? availableBeds = null,
    Object? locationId = null,
  }) {
    return _then(
      _$ShelterImpl(
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
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
        availableBeds: null == availableBeds
            ? _value.availableBeds
            : availableBeds // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$ShelterImpl implements _Shelter {
  const _$ShelterImpl({
    required this.id,
    required this.name,
    required this.address,
    required this.capacity,
    required this.availableBeds,
    required this.locationId,
  });

  factory _$ShelterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final int capacity;
  @override
  final int availableBeds;
  @override
  final String locationId;

  @override
  String toString() {
    return 'Shelter(id: $id, name: $name, address: $address, capacity: $capacity, availableBeds: $availableBeds, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.availableBeds, availableBeds) ||
                other.availableBeds == availableBeds) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    capacity,
    availableBeds,
    locationId,
  );

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterImplCopyWith<_$ShelterImpl> get copyWith =>
      __$$ShelterImplCopyWithImpl<_$ShelterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterImplToJson(this);
  }
}

abstract class _Shelter implements Shelter {
  const factory _Shelter({
    required final String id,
    required final String name,
    required final String address,
    required final int capacity,
    required final int availableBeds,
    required final String locationId,
  }) = _$ShelterImpl;

  factory _Shelter.fromJson(Map<String, dynamic> json) = _$ShelterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  int get capacity;
  @override
  int get availableBeds;
  @override
  String get locationId;

  /// Create a copy of Shelter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterImplCopyWith<_$ShelterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
