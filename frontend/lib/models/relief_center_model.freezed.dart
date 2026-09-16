// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relief_center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReliefCenter _$ReliefCenterFromJson(Map<String, dynamic> json) {
  return _ReliefCenter.fromJson(json);
}

/// @nodoc
mixin _$ReliefCenter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get resources => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this ReliefCenter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReliefCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReliefCenterCopyWith<ReliefCenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReliefCenterCopyWith<$Res> {
  factory $ReliefCenterCopyWith(
    ReliefCenter value,
    $Res Function(ReliefCenter) then,
  ) = _$ReliefCenterCopyWithImpl<$Res, ReliefCenter>;
  @useResult
  $Res call({
    String id,
    String name,
    List<String> resources,
    String locationId,
  });
}

/// @nodoc
class _$ReliefCenterCopyWithImpl<$Res, $Val extends ReliefCenter>
    implements $ReliefCenterCopyWith<$Res> {
  _$ReliefCenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReliefCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? resources = null,
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
            resources: null == resources
                ? _value.resources
                : resources // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$ReliefCenterImplCopyWith<$Res>
    implements $ReliefCenterCopyWith<$Res> {
  factory _$$ReliefCenterImplCopyWith(
    _$ReliefCenterImpl value,
    $Res Function(_$ReliefCenterImpl) then,
  ) = __$$ReliefCenterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<String> resources,
    String locationId,
  });
}

/// @nodoc
class __$$ReliefCenterImplCopyWithImpl<$Res>
    extends _$ReliefCenterCopyWithImpl<$Res, _$ReliefCenterImpl>
    implements _$$ReliefCenterImplCopyWith<$Res> {
  __$$ReliefCenterImplCopyWithImpl(
    _$ReliefCenterImpl _value,
    $Res Function(_$ReliefCenterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReliefCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? resources = null,
    Object? locationId = null,
  }) {
    return _then(
      _$ReliefCenterImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        resources: null == resources
            ? _value._resources
            : resources // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$ReliefCenterImpl implements _ReliefCenter {
  const _$ReliefCenterImpl({
    required this.id,
    required this.name,
    required final List<String> resources,
    required this.locationId,
  }) : _resources = resources;

  factory _$ReliefCenterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReliefCenterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _resources;
  @override
  List<String> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  @override
  final String locationId;

  @override
  String toString() {
    return 'ReliefCenter(id: $id, name: $name, resources: $resources, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReliefCenterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._resources,
              _resources,
            ) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_resources),
    locationId,
  );

  /// Create a copy of ReliefCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReliefCenterImplCopyWith<_$ReliefCenterImpl> get copyWith =>
      __$$ReliefCenterImplCopyWithImpl<_$ReliefCenterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReliefCenterImplToJson(this);
  }
}

abstract class _ReliefCenter implements ReliefCenter {
  const factory _ReliefCenter({
    required final String id,
    required final String name,
    required final List<String> resources,
    required final String locationId,
  }) = _$ReliefCenterImpl;

  factory _ReliefCenter.fromJson(Map<String, dynamic> json) =
      _$ReliefCenterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get resources;
  @override
  String get locationId;

  /// Create a copy of ReliefCenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReliefCenterImplCopyWith<_$ReliefCenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
