// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportAttachment _$ReportAttachmentFromJson(Map<String, dynamic> json) {
  return _ReportAttachment.fromJson(json);
}

/// @nodoc
mixin _$ReportAttachment {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this ReportAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportAttachmentCopyWith<ReportAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportAttachmentCopyWith<$Res> {
  factory $ReportAttachmentCopyWith(
    ReportAttachment value,
    $Res Function(ReportAttachment) then,
  ) = _$ReportAttachmentCopyWithImpl<$Res, ReportAttachment>;
  @useResult
  $Res call({String id, String url, String type});
}

/// @nodoc
class _$ReportAttachmentCopyWithImpl<$Res, $Val extends ReportAttachment>
    implements $ReportAttachmentCopyWith<$Res> {
  _$ReportAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? url = null, Object? type = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportAttachmentImplCopyWith<$Res>
    implements $ReportAttachmentCopyWith<$Res> {
  factory _$$ReportAttachmentImplCopyWith(
    _$ReportAttachmentImpl value,
    $Res Function(_$ReportAttachmentImpl) then,
  ) = __$$ReportAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url, String type});
}

/// @nodoc
class __$$ReportAttachmentImplCopyWithImpl<$Res>
    extends _$ReportAttachmentCopyWithImpl<$Res, _$ReportAttachmentImpl>
    implements _$$ReportAttachmentImplCopyWith<$Res> {
  __$$ReportAttachmentImplCopyWithImpl(
    _$ReportAttachmentImpl _value,
    $Res Function(_$ReportAttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? url = null, Object? type = null}) {
    return _then(
      _$ReportAttachmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportAttachmentImpl implements _ReportAttachment {
  const _$ReportAttachmentImpl({
    required this.id,
    required this.url,
    required this.type,
  });

  factory _$ReportAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportAttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String type;

  @override
  String toString() {
    return 'ReportAttachment(id: $id, url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, type);

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportAttachmentImplCopyWith<_$ReportAttachmentImpl> get copyWith =>
      __$$ReportAttachmentImplCopyWithImpl<_$ReportAttachmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportAttachmentImplToJson(this);
  }
}

abstract class _ReportAttachment implements ReportAttachment {
  const factory _ReportAttachment({
    required final String id,
    required final String url,
    required final String type,
  }) = _$ReportAttachmentImpl;

  factory _ReportAttachment.fromJson(Map<String, dynamic> json) =
      _$ReportAttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get type;

  /// Create a copy of ReportAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportAttachmentImplCopyWith<_$ReportAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
