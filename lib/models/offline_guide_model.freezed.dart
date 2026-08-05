// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_guide_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OfflineGuide _$OfflineGuideFromJson(Map<String, dynamic> json) {
  return _OfflineGuide.fromJson(json);
}

/// @nodoc
mixin _$OfflineGuide {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Serializes this OfflineGuide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfflineGuide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfflineGuideCopyWith<OfflineGuide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineGuideCopyWith<$Res> {
  factory $OfflineGuideCopyWith(
    OfflineGuide value,
    $Res Function(OfflineGuide) then,
  ) = _$OfflineGuideCopyWithImpl<$Res, OfflineGuide>;
  @useResult
  $Res call({String id, String title, String content, String category});
}

/// @nodoc
class _$OfflineGuideCopyWithImpl<$Res, $Val extends OfflineGuide>
    implements $OfflineGuideCopyWith<$Res> {
  _$OfflineGuideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfflineGuide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfflineGuideImplCopyWith<$Res>
    implements $OfflineGuideCopyWith<$Res> {
  factory _$$OfflineGuideImplCopyWith(
    _$OfflineGuideImpl value,
    $Res Function(_$OfflineGuideImpl) then,
  ) = __$$OfflineGuideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content, String category});
}

/// @nodoc
class __$$OfflineGuideImplCopyWithImpl<$Res>
    extends _$OfflineGuideCopyWithImpl<$Res, _$OfflineGuideImpl>
    implements _$$OfflineGuideImplCopyWith<$Res> {
  __$$OfflineGuideImplCopyWithImpl(
    _$OfflineGuideImpl _value,
    $Res Function(_$OfflineGuideImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfflineGuide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? category = null,
  }) {
    return _then(
      _$OfflineGuideImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineGuideImpl implements _OfflineGuide {
  const _$OfflineGuideImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
  });

  factory _$OfflineGuideImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineGuideImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String category;

  @override
  String toString() {
    return 'OfflineGuide(id: $id, title: $title, content: $content, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineGuideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, category);

  /// Create a copy of OfflineGuide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineGuideImplCopyWith<_$OfflineGuideImpl> get copyWith =>
      __$$OfflineGuideImplCopyWithImpl<_$OfflineGuideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineGuideImplToJson(this);
  }
}

abstract class _OfflineGuide implements OfflineGuide {
  const factory _OfflineGuide({
    required final String id,
    required final String title,
    required final String content,
    required final String category,
  }) = _$OfflineGuideImpl;

  factory _OfflineGuide.fromJson(Map<String, dynamic> json) =
      _$OfflineGuideImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get category;

  /// Create a copy of OfflineGuide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineGuideImplCopyWith<_$OfflineGuideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
