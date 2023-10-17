// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'objective.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Objective _$ObjectiveFromJson(Map<String, dynamic> json) {
  return _Objective.fromJson(json);
}

/// @nodoc
mixin _$Objective {
  String? get objectiveId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get okrId => throw _privateConstructorUsedError;
  List<Objective>? get relatedObjective => throw _privateConstructorUsedError;
  String? get unitId => throw _privateConstructorUsedError;
  String? get unitName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObjectiveCopyWith<Objective> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectiveCopyWith<$Res> {
  factory $ObjectiveCopyWith(Objective value, $Res Function(Objective) then) =
      _$ObjectiveCopyWithImpl<$Res, Objective>;
  @useResult
  $Res call(
      {String? objectiveId,
      String? title,
      String? description,
      String? okrId,
      List<Objective>? relatedObjective,
      String? unitId,
      String? unitName});
}

/// @nodoc
class _$ObjectiveCopyWithImpl<$Res, $Val extends Objective>
    implements $ObjectiveCopyWith<$Res> {
  _$ObjectiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectiveId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? okrId = freezed,
    Object? relatedObjective = freezed,
    Object? unitId = freezed,
    Object? unitName = freezed,
  }) {
    return _then(_value.copyWith(
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      okrId: freezed == okrId
          ? _value.okrId
          : okrId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedObjective: freezed == relatedObjective
          ? _value.relatedObjective
          : relatedObjective // ignore: cast_nullable_to_non_nullable
              as List<Objective>?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObjectiveImplCopyWith<$Res>
    implements $ObjectiveCopyWith<$Res> {
  factory _$$ObjectiveImplCopyWith(
          _$ObjectiveImpl value, $Res Function(_$ObjectiveImpl) then) =
      __$$ObjectiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? objectiveId,
      String? title,
      String? description,
      String? okrId,
      List<Objective>? relatedObjective,
      String? unitId,
      String? unitName});
}

/// @nodoc
class __$$ObjectiveImplCopyWithImpl<$Res>
    extends _$ObjectiveCopyWithImpl<$Res, _$ObjectiveImpl>
    implements _$$ObjectiveImplCopyWith<$Res> {
  __$$ObjectiveImplCopyWithImpl(
      _$ObjectiveImpl _value, $Res Function(_$ObjectiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectiveId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? okrId = freezed,
    Object? relatedObjective = freezed,
    Object? unitId = freezed,
    Object? unitName = freezed,
  }) {
    return _then(_$ObjectiveImpl(
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      okrId: freezed == okrId
          ? _value.okrId
          : okrId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedObjective: freezed == relatedObjective
          ? _value._relatedObjective
          : relatedObjective // ignore: cast_nullable_to_non_nullable
              as List<Objective>?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObjectiveImpl implements _Objective {
  _$ObjectiveImpl(
      {this.objectiveId,
      this.title,
      this.description,
      this.okrId,
      final List<Objective>? relatedObjective,
      this.unitId,
      this.unitName})
      : _relatedObjective = relatedObjective;

  factory _$ObjectiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectiveImplFromJson(json);

  @override
  final String? objectiveId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? okrId;
  final List<Objective>? _relatedObjective;
  @override
  List<Objective>? get relatedObjective {
    final value = _relatedObjective;
    if (value == null) return null;
    if (_relatedObjective is EqualUnmodifiableListView)
      return _relatedObjective;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? unitId;
  @override
  final String? unitName;

  @override
  String toString() {
    return 'Objective(objectiveId: $objectiveId, title: $title, description: $description, okrId: $okrId, relatedObjective: $relatedObjective, unitId: $unitId, unitName: $unitName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectiveImpl &&
            (identical(other.objectiveId, objectiveId) ||
                other.objectiveId == objectiveId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.okrId, okrId) || other.okrId == okrId) &&
            const DeepCollectionEquality()
                .equals(other._relatedObjective, _relatedObjective) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectiveId,
      title,
      description,
      okrId,
      const DeepCollectionEquality().hash(_relatedObjective),
      unitId,
      unitName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectiveImplCopyWith<_$ObjectiveImpl> get copyWith =>
      __$$ObjectiveImplCopyWithImpl<_$ObjectiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObjectiveImplToJson(
      this,
    );
  }
}

abstract class _Objective implements Objective {
  factory _Objective(
      {final String? objectiveId,
      final String? title,
      final String? description,
      final String? okrId,
      final List<Objective>? relatedObjective,
      final String? unitId,
      final String? unitName}) = _$ObjectiveImpl;

  factory _Objective.fromJson(Map<String, dynamic> json) =
      _$ObjectiveImpl.fromJson;

  @override
  String? get objectiveId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get okrId;
  @override
  List<Objective>? get relatedObjective;
  @override
  String? get unitId;
  @override
  String? get unitName;
  @override
  @JsonKey(ignore: true)
  _$$ObjectiveImplCopyWith<_$ObjectiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
