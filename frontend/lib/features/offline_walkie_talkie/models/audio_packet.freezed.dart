// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_packet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AudioPacket _$AudioPacketFromJson(Map<String, dynamic> json) {
  return _AudioPacket.fromJson(json);
}

/// @nodoc
mixin _$AudioPacket {
  String get packetId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  int get sequenceNumber => throw _privateConstructorUsedError;
  DateTime get timestamp =>
      throw _privateConstructorUsedError; // We store audio data as a base64 encoded string or raw list of ints
  // Uint8List is not directly JSON serializable by default, so we'll use a List<int>
  // or rely on a custom converter if we needed optimal binary format.
  // For Nearby Connections payload, we can use a custom Converter.
  List<int> get audioData => throw _privateConstructorUsedError;
  bool get isLastPacket => throw _privateConstructorUsedError;

  /// Serializes this AudioPacket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioPacket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioPacketCopyWith<AudioPacket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPacketCopyWith<$Res> {
  factory $AudioPacketCopyWith(
    AudioPacket value,
    $Res Function(AudioPacket) then,
  ) = _$AudioPacketCopyWithImpl<$Res, AudioPacket>;
  @useResult
  $Res call({
    String packetId,
    String sessionId,
    String senderId,
    int sequenceNumber,
    DateTime timestamp,
    List<int> audioData,
    bool isLastPacket,
  });
}

/// @nodoc
class _$AudioPacketCopyWithImpl<$Res, $Val extends AudioPacket>
    implements $AudioPacketCopyWith<$Res> {
  _$AudioPacketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioPacket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packetId = null,
    Object? sessionId = null,
    Object? senderId = null,
    Object? sequenceNumber = null,
    Object? timestamp = null,
    Object? audioData = null,
    Object? isLastPacket = null,
  }) {
    return _then(
      _value.copyWith(
            packetId: null == packetId
                ? _value.packetId
                : packetId // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            sequenceNumber: null == sequenceNumber
                ? _value.sequenceNumber
                : sequenceNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            audioData: null == audioData
                ? _value.audioData
                : audioData // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            isLastPacket: null == isLastPacket
                ? _value.isLastPacket
                : isLastPacket // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AudioPacketImplCopyWith<$Res>
    implements $AudioPacketCopyWith<$Res> {
  factory _$$AudioPacketImplCopyWith(
    _$AudioPacketImpl value,
    $Res Function(_$AudioPacketImpl) then,
  ) = __$$AudioPacketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String packetId,
    String sessionId,
    String senderId,
    int sequenceNumber,
    DateTime timestamp,
    List<int> audioData,
    bool isLastPacket,
  });
}

/// @nodoc
class __$$AudioPacketImplCopyWithImpl<$Res>
    extends _$AudioPacketCopyWithImpl<$Res, _$AudioPacketImpl>
    implements _$$AudioPacketImplCopyWith<$Res> {
  __$$AudioPacketImplCopyWithImpl(
    _$AudioPacketImpl _value,
    $Res Function(_$AudioPacketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AudioPacket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packetId = null,
    Object? sessionId = null,
    Object? senderId = null,
    Object? sequenceNumber = null,
    Object? timestamp = null,
    Object? audioData = null,
    Object? isLastPacket = null,
  }) {
    return _then(
      _$AudioPacketImpl(
        packetId: null == packetId
            ? _value.packetId
            : packetId // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        sequenceNumber: null == sequenceNumber
            ? _value.sequenceNumber
            : sequenceNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        audioData: null == audioData
            ? _value._audioData
            : audioData // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        isLastPacket: null == isLastPacket
            ? _value.isLastPacket
            : isLastPacket // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioPacketImpl implements _AudioPacket {
  const _$AudioPacketImpl({
    required this.packetId,
    required this.sessionId,
    required this.senderId,
    required this.sequenceNumber,
    required this.timestamp,
    required final List<int> audioData,
    required this.isLastPacket,
  }) : _audioData = audioData;

  factory _$AudioPacketImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioPacketImplFromJson(json);

  @override
  final String packetId;
  @override
  final String sessionId;
  @override
  final String senderId;
  @override
  final int sequenceNumber;
  @override
  final DateTime timestamp;
  // We store audio data as a base64 encoded string or raw list of ints
  // Uint8List is not directly JSON serializable by default, so we'll use a List<int>
  // or rely on a custom converter if we needed optimal binary format.
  // For Nearby Connections payload, we can use a custom Converter.
  final List<int> _audioData;
  // We store audio data as a base64 encoded string or raw list of ints
  // Uint8List is not directly JSON serializable by default, so we'll use a List<int>
  // or rely on a custom converter if we needed optimal binary format.
  // For Nearby Connections payload, we can use a custom Converter.
  @override
  List<int> get audioData {
    if (_audioData is EqualUnmodifiableListView) return _audioData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioData);
  }

  @override
  final bool isLastPacket;

  @override
  String toString() {
    return 'AudioPacket(packetId: $packetId, sessionId: $sessionId, senderId: $senderId, sequenceNumber: $sequenceNumber, timestamp: $timestamp, audioData: $audioData, isLastPacket: $isLastPacket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPacketImpl &&
            (identical(other.packetId, packetId) ||
                other.packetId == packetId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(
              other._audioData,
              _audioData,
            ) &&
            (identical(other.isLastPacket, isLastPacket) ||
                other.isLastPacket == isLastPacket));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    packetId,
    sessionId,
    senderId,
    sequenceNumber,
    timestamp,
    const DeepCollectionEquality().hash(_audioData),
    isLastPacket,
  );

  /// Create a copy of AudioPacket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPacketImplCopyWith<_$AudioPacketImpl> get copyWith =>
      __$$AudioPacketImplCopyWithImpl<_$AudioPacketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioPacketImplToJson(this);
  }
}

abstract class _AudioPacket implements AudioPacket {
  const factory _AudioPacket({
    required final String packetId,
    required final String sessionId,
    required final String senderId,
    required final int sequenceNumber,
    required final DateTime timestamp,
    required final List<int> audioData,
    required final bool isLastPacket,
  }) = _$AudioPacketImpl;

  factory _AudioPacket.fromJson(Map<String, dynamic> json) =
      _$AudioPacketImpl.fromJson;

  @override
  String get packetId;
  @override
  String get sessionId;
  @override
  String get senderId;
  @override
  int get sequenceNumber;
  @override
  DateTime get timestamp; // We store audio data as a base64 encoded string or raw list of ints
  // Uint8List is not directly JSON serializable by default, so we'll use a List<int>
  // or rely on a custom converter if we needed optimal binary format.
  // For Nearby Connections payload, we can use a custom Converter.
  @override
  List<int> get audioData;
  @override
  bool get isLastPacket;

  /// Create a copy of AudioPacket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioPacketImplCopyWith<_$AudioPacketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
