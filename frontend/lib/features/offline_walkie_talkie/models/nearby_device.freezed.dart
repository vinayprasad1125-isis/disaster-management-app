// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NearbyDevice _$NearbyDeviceFromJson(Map<String, dynamic> json) {
  return _NearbyDevice.fromJson(json);
}

/// @nodoc
mixin _$NearbyDevice {
  String get id =>
      throw _privateConstructorUsedError; // The endpointId from Nearby Connections
  String get name => throw _privateConstructorUsedError;
  DeviceStatus get status => throw _privateConstructorUsedError;
  SignalStrength get signalStrength => throw _privateConstructorUsedError;
  ConnectionType get connectionType => throw _privateConstructorUsedError;
  double? get distanceInMeters =>
      throw _privateConstructorUsedError; // Estimated distance
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this NearbyDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyDeviceCopyWith<NearbyDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyDeviceCopyWith<$Res> {
  factory $NearbyDeviceCopyWith(
    NearbyDevice value,
    $Res Function(NearbyDevice) then,
  ) = _$NearbyDeviceCopyWithImpl<$Res, NearbyDevice>;
  @useResult
  $Res call({
    String id,
    String name,
    DeviceStatus status,
    SignalStrength signalStrength,
    ConnectionType connectionType,
    double? distanceInMeters,
    String? avatarUrl,
  });
}

/// @nodoc
class _$NearbyDeviceCopyWithImpl<$Res, $Val extends NearbyDevice>
    implements $NearbyDeviceCopyWith<$Res> {
  _$NearbyDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? signalStrength = null,
    Object? connectionType = null,
    Object? distanceInMeters = freezed,
    Object? avatarUrl = freezed,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DeviceStatus,
            signalStrength: null == signalStrength
                ? _value.signalStrength
                : signalStrength // ignore: cast_nullable_to_non_nullable
                      as SignalStrength,
            connectionType: null == connectionType
                ? _value.connectionType
                : connectionType // ignore: cast_nullable_to_non_nullable
                      as ConnectionType,
            distanceInMeters: freezed == distanceInMeters
                ? _value.distanceInMeters
                : distanceInMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NearbyDeviceImplCopyWith<$Res>
    implements $NearbyDeviceCopyWith<$Res> {
  factory _$$NearbyDeviceImplCopyWith(
    _$NearbyDeviceImpl value,
    $Res Function(_$NearbyDeviceImpl) then,
  ) = __$$NearbyDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    DeviceStatus status,
    SignalStrength signalStrength,
    ConnectionType connectionType,
    double? distanceInMeters,
    String? avatarUrl,
  });
}

/// @nodoc
class __$$NearbyDeviceImplCopyWithImpl<$Res>
    extends _$NearbyDeviceCopyWithImpl<$Res, _$NearbyDeviceImpl>
    implements _$$NearbyDeviceImplCopyWith<$Res> {
  __$$NearbyDeviceImplCopyWithImpl(
    _$NearbyDeviceImpl _value,
    $Res Function(_$NearbyDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearbyDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? signalStrength = null,
    Object? connectionType = null,
    Object? distanceInMeters = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$NearbyDeviceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DeviceStatus,
        signalStrength: null == signalStrength
            ? _value.signalStrength
            : signalStrength // ignore: cast_nullable_to_non_nullable
                  as SignalStrength,
        connectionType: null == connectionType
            ? _value.connectionType
            : connectionType // ignore: cast_nullable_to_non_nullable
                  as ConnectionType,
        distanceInMeters: freezed == distanceInMeters
            ? _value.distanceInMeters
            : distanceInMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyDeviceImpl implements _NearbyDevice {
  const _$NearbyDeviceImpl({
    required this.id,
    required this.name,
    this.status = DeviceStatus.discovered,
    this.signalStrength = SignalStrength.none,
    this.connectionType = ConnectionType.unknown,
    this.distanceInMeters,
    this.avatarUrl,
  });

  factory _$NearbyDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyDeviceImplFromJson(json);

  @override
  final String id;
  // The endpointId from Nearby Connections
  @override
  final String name;
  @override
  @JsonKey()
  final DeviceStatus status;
  @override
  @JsonKey()
  final SignalStrength signalStrength;
  @override
  @JsonKey()
  final ConnectionType connectionType;
  @override
  final double? distanceInMeters;
  // Estimated distance
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'NearbyDevice(id: $id, name: $name, status: $status, signalStrength: $signalStrength, connectionType: $connectionType, distanceInMeters: $distanceInMeters, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.signalStrength, signalStrength) ||
                other.signalStrength == signalStrength) &&
            (identical(other.connectionType, connectionType) ||
                other.connectionType == connectionType) &&
            (identical(other.distanceInMeters, distanceInMeters) ||
                other.distanceInMeters == distanceInMeters) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    status,
    signalStrength,
    connectionType,
    distanceInMeters,
    avatarUrl,
  );

  /// Create a copy of NearbyDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyDeviceImplCopyWith<_$NearbyDeviceImpl> get copyWith =>
      __$$NearbyDeviceImplCopyWithImpl<_$NearbyDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyDeviceImplToJson(this);
  }
}

abstract class _NearbyDevice implements NearbyDevice {
  const factory _NearbyDevice({
    required final String id,
    required final String name,
    final DeviceStatus status,
    final SignalStrength signalStrength,
    final ConnectionType connectionType,
    final double? distanceInMeters,
    final String? avatarUrl,
  }) = _$NearbyDeviceImpl;

  factory _NearbyDevice.fromJson(Map<String, dynamic> json) =
      _$NearbyDeviceImpl.fromJson;

  @override
  String get id; // The endpointId from Nearby Connections
  @override
  String get name;
  @override
  DeviceStatus get status;
  @override
  SignalStrength get signalStrength;
  @override
  ConnectionType get connectionType;
  @override
  double? get distanceInMeters; // Estimated distance
  @override
  String? get avatarUrl;

  /// Create a copy of NearbyDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyDeviceImplCopyWith<_$NearbyDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
