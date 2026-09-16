// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Volunteer _$VolunteerFromJson(Map<String, dynamic> json) {
  return _Volunteer.fromJson(json);
}

/// @nodoc
mixin _$Volunteer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String get availability => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;

  /// Serializes this Volunteer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Volunteer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VolunteerCopyWith<Volunteer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteerCopyWith<$Res> {
  factory $VolunteerCopyWith(Volunteer value, $Res Function(Volunteer) then) =
      _$VolunteerCopyWithImpl<$Res, Volunteer>;
  @useResult
  $Res call({
    String id,
    String name,
    List<String> skills,
    String availability,
    String locationId,
  });
}

/// @nodoc
class _$VolunteerCopyWithImpl<$Res, $Val extends Volunteer>
    implements $VolunteerCopyWith<$Res> {
  _$VolunteerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Volunteer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? skills = null,
    Object? availability = null,
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
            skills: null == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            availability: null == availability
                ? _value.availability
                : availability // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VolunteerImplCopyWith<$Res>
    implements $VolunteerCopyWith<$Res> {
  factory _$$VolunteerImplCopyWith(
    _$VolunteerImpl value,
    $Res Function(_$VolunteerImpl) then,
  ) = __$$VolunteerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<String> skills,
    String availability,
    String locationId,
  });
}

/// @nodoc
class __$$VolunteerImplCopyWithImpl<$Res>
    extends _$VolunteerCopyWithImpl<$Res, _$VolunteerImpl>
    implements _$$VolunteerImplCopyWith<$Res> {
  __$$VolunteerImplCopyWithImpl(
    _$VolunteerImpl _value,
    $Res Function(_$VolunteerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Volunteer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? skills = null,
    Object? availability = null,
    Object? locationId = null,
  }) {
    return _then(
      _$VolunteerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        skills: null == skills
            ? _value._skills
            : skills // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        availability: null == availability
            ? _value.availability
            : availability // ignore: cast_nullable_to_non_nullable
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
class _$VolunteerImpl implements _Volunteer {
  const _$VolunteerImpl({
    required this.id,
    required this.name,
    required final List<String> skills,
    required this.availability,
    required this.locationId,
  }) : _skills = skills;

  factory _$VolunteerImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolunteerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final String availability;
  @override
  final String locationId;

  @override
  String toString() {
    return 'Volunteer(id: $id, name: $name, skills: $skills, availability: $availability, locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolunteerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_skills),
    availability,
    locationId,
  );

  /// Create a copy of Volunteer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolunteerImplCopyWith<_$VolunteerImpl> get copyWith =>
      __$$VolunteerImplCopyWithImpl<_$VolunteerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolunteerImplToJson(this);
  }
}

abstract class _Volunteer implements Volunteer {
  const factory _Volunteer({
    required final String id,
    required final String name,
    required final List<String> skills,
    required final String availability,
    required final String locationId,
  }) = _$VolunteerImpl;

  factory _Volunteer.fromJson(Map<String, dynamic> json) =
      _$VolunteerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get skills;
  @override
  String get availability;
  @override
  String get locationId;

  /// Create a copy of Volunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolunteerImplCopyWith<_$VolunteerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
