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
  set objectiveId(String? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get okrId => throw _privateConstructorUsedError;
  set okrId(String? value) => throw _privateConstructorUsedError;
  List<Objective>? get relatedObjective => throw _privateConstructorUsedError;
  set relatedObjective(List<Objective>? value) =>
      throw _privateConstructorUsedError;
  String? get unitId => throw _privateConstructorUsedError;
  set unitId(String? value) => throw _privateConstructorUsedError;
  String? get unitName => throw _privateConstructorUsedError;
  set unitName(String? value) => throw _privateConstructorUsedError;

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
      this.relatedObjective,
      this.unitId,
      this.unitName});

  factory _$ObjectiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectiveImplFromJson(json);

  @override
  String? objectiveId;
  @override
  String? title;
  @override
  String? description;
  @override
  String? okrId;
  @override
  List<Objective>? relatedObjective;
  @override
  String? unitId;
  @override
  String? unitName;

  @override
  String toString() {
    return 'Objective(objectiveId: $objectiveId, title: $title, description: $description, okrId: $okrId, relatedObjective: $relatedObjective, unitId: $unitId, unitName: $unitName)';
  }

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
      {String? objectiveId,
      String? title,
      String? description,
      String? okrId,
      List<Objective>? relatedObjective,
      String? unitId,
      String? unitName}) = _$ObjectiveImpl;

  factory _Objective.fromJson(Map<String, dynamic> json) =
      _$ObjectiveImpl.fromJson;

  @override
  String? get objectiveId;
  set objectiveId(String? value);
  @override
  String? get title;
  set title(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get okrId;
  set okrId(String? value);
  @override
  List<Objective>? get relatedObjective;
  set relatedObjective(List<Objective>? value);
  @override
  String? get unitId;
  set unitId(String? value);
  @override
  String? get unitName;
  set unitName(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ObjectiveImplCopyWith<_$ObjectiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
