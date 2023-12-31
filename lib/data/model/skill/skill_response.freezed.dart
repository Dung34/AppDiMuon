// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkillResponse _$SkillResponseFromJson(Map<String, dynamic> json) {
  return _SkillResponse.fromJson(json);
}

/// @nodoc
mixin _$SkillResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillResponseCopyWith<SkillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillResponseCopyWith<$Res> {
  factory $SkillResponseCopyWith(
          SkillResponse value, $Res Function(SkillResponse) then) =
      _$SkillResponseCopyWithImpl<$Res, SkillResponse>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? point,
      String? description,
      String? icon,
      String? userId});
}

/// @nodoc
class _$SkillResponseCopyWithImpl<$Res, $Val extends SkillResponse>
    implements $SkillResponseCopyWith<$Res> {
  _$SkillResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? point = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillResponseImplCopyWith<$Res>
    implements $SkillResponseCopyWith<$Res> {
  factory _$$SkillResponseImplCopyWith(
          _$SkillResponseImpl value, $Res Function(_$SkillResponseImpl) then) =
      __$$SkillResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? point,
      String? description,
      String? icon,
      String? userId});
}

/// @nodoc
class __$$SkillResponseImplCopyWithImpl<$Res>
    extends _$SkillResponseCopyWithImpl<$Res, _$SkillResponseImpl>
    implements _$$SkillResponseImplCopyWith<$Res> {
  __$$SkillResponseImplCopyWithImpl(
      _$SkillResponseImpl _value, $Res Function(_$SkillResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? point = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$SkillResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillResponseImpl implements _SkillResponse {
  _$SkillResponseImpl(
      {this.id,
      this.name,
      this.point,
      this.description,
      this.icon,
      this.userId});

  factory _$SkillResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? point;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String? userId;

  @override
  String toString() {
    return 'SkillResponse(id: $id, name: $name, point: $point, description: $description, icon: $icon, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, point, description, icon, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillResponseImplCopyWith<_$SkillResponseImpl> get copyWith =>
      __$$SkillResponseImplCopyWithImpl<_$SkillResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillResponseImplToJson(
      this,
    );
  }
}

abstract class _SkillResponse implements SkillResponse {
  factory _SkillResponse(
      {final String? id,
      final String? name,
      final int? point,
      final String? description,
      final String? icon,
      final String? userId}) = _$SkillResponseImpl;

  factory _SkillResponse.fromJson(Map<String, dynamic> json) =
      _$SkillResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get point;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$SkillResponseImplCopyWith<_$SkillResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
