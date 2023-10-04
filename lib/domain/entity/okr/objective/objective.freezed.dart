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
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get okrId => throw _privateConstructorUsedError;
  List<Objective>? get relatedObjective => throw _privateConstructorUsedError;
  String? get unitId => throw _privateConstructorUsedError;
  String? get unitName => throw _privateConstructorUsedError;
  double? get process => throw _privateConstructorUsedError;

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
      {String? id,
      String? title,
      String? description,
      String? okrId,
      List<Objective>? relatedObjective,
      String? unitId,
      String? unitName,
      double? process});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? okrId = freezed,
    Object? relatedObjective = freezed,
    Object? unitId = freezed,
    Object? unitName = freezed,
    Object? process = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      process: freezed == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObjectiveCopyWith<$Res> implements $ObjectiveCopyWith<$Res> {
  factory _$$_ObjectiveCopyWith(
          _$_Objective value, $Res Function(_$_Objective) then) =
      __$$_ObjectiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? okrId,
      List<Objective>? relatedObjective,
      String? unitId,
      String? unitName,
      double? process});
}

/// @nodoc
class __$$_ObjectiveCopyWithImpl<$Res>
    extends _$ObjectiveCopyWithImpl<$Res, _$_Objective>
    implements _$$_ObjectiveCopyWith<$Res> {
  __$$_ObjectiveCopyWithImpl(
      _$_Objective _value, $Res Function(_$_Objective) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? okrId = freezed,
    Object? relatedObjective = freezed,
    Object? unitId = freezed,
    Object? unitName = freezed,
    Object? process = freezed,
  }) {
    return _then(_$_Objective(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      process: freezed == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Objective implements _Objective {
  _$_Objective(
      {this.id,
      this.title,
      this.description,
      this.okrId,
      final List<Objective>? relatedObjective,
      this.unitId,
      this.unitName,
      this.process})
      : _relatedObjective = relatedObjective;

  factory _$_Objective.fromJson(Map<String, dynamic> json) =>
      _$$_ObjectiveFromJson(json);

  @override
  final String? id;
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
  final double? process;

  @override
  String toString() {
    return 'Objective(id: $id, title: $title, description: $description, okrId: $okrId, relatedObjective: $relatedObjective, unitId: $unitId, unitName: $unitName, process: $process)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Objective &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.okrId, okrId) || other.okrId == okrId) &&
            const DeepCollectionEquality()
                .equals(other._relatedObjective, _relatedObjective) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.process, process) || other.process == process));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      okrId,
      const DeepCollectionEquality().hash(_relatedObjective),
      unitId,
      unitName,
      process);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObjectiveCopyWith<_$_Objective> get copyWith =>
      __$$_ObjectiveCopyWithImpl<_$_Objective>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObjectiveToJson(
      this,
    );
  }
}

abstract class _Objective implements Objective {
  factory _Objective(
      {final String? id,
      final String? title,
      final String? description,
      final String? okrId,
      final List<Objective>? relatedObjective,
      final String? unitId,
      final String? unitName,
      final double? process}) = _$_Objective;

  factory _Objective.fromJson(Map<String, dynamic> json) =
      _$_Objective.fromJson;

  @override
  String? get id;
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
  double? get process;
  @override
  @JsonKey(ignore: true)
  _$$_ObjectiveCopyWith<_$_Objective> get copyWith =>
      throw _privateConstructorUsedError;
}
