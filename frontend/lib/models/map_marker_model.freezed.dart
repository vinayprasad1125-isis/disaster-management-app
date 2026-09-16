// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_marker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MapMarker _$MapMarkerFromJson(Map<String, dynamic> json) {
  return _MapMarker.fromJson(json);
}

/// @nodoc
mixin _$MapMarker {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this MapMarker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapMarkerCopyWith<MapMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapMarkerCopyWith<$Res> {
  factory $MapMarkerCopyWith(MapMarker value, $Res Function(MapMarker) then) =
      _$MapMarkerCopyWithImpl<$Res, MapMarker>;
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    String locationId,
    double lat,
    double lng,
  });
}

/// @nodoc
class _$MapMarkerCopyWithImpl<$Res, $Val extends MapMarker>
    implements $MapMarkerCopyWith<$Res> {
  _$MapMarkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? locationId = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            locationId: null == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
                      as String,
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MapMarkerImplCopyWith<$Res>
    implements $MapMarkerCopyWith<$Res> {
  factory _$$MapMarkerImplCopyWith(
    _$MapMarkerImpl value,
    $Res Function(_$MapMarkerImpl) then,
  ) = __$$MapMarkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    String locationId,
    double lat,
    double lng,
  });
}

/// @nodoc
class __$$MapMarkerImplCopyWithImpl<$Res>
    extends _$MapMarkerCopyWithImpl<$Res, _$MapMarkerImpl>
    implements _$$MapMarkerImplCopyWith<$Res> {
  __$$MapMarkerImplCopyWithImpl(
    _$MapMarkerImpl _value,
    $Res Function(_$MapMarkerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? locationId = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(
      _$MapMarkerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: null == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String,
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MapMarkerImpl implements _MapMarker {
  const _$MapMarkerImpl({
    required this.id,
    required this.title,
    required this.type,
    required this.locationId,
    required this.lat,
    required this.lng,
  });

  factory _$MapMarkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapMarkerImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final String locationId;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'MapMarker(id: $id, title: $title, type: $type, locationId: $locationId, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapMarkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, locationId, lat, lng);

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapMarkerImplCopyWith<_$MapMarkerImpl> get copyWith =>
      __$$MapMarkerImplCopyWithImpl<_$MapMarkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapMarkerImplToJson(this);
  }
}

abstract class _MapMarker implements MapMarker {
  const factory _MapMarker({
    required final String id,
    required final String title,
    required final String type,
    required final String locationId,
    required final double lat,
    required final double lng,
  }) = _$MapMarkerImpl;

  factory _MapMarker.fromJson(Map<String, dynamic> json) =
      _$MapMarkerImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  String get locationId;
  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapMarkerImplCopyWith<_$MapMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
