// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'okr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OKR _$OKRFromJson(Map<String, dynamic> json) {
  return _OKR.fromJson(json);
}

/// @nodoc
mixin _$OKR {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get unitId => throw _privateConstructorUsedError;
  String? get process => throw _privateConstructorUsedError;
  int? get totalObjective => throw _privateConstructorUsedError;
  int? get totalKR => throw _privateConstructorUsedError;
  int? get totalTask => throw _privateConstructorUsedError;
  List<Objective>? get objectives => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OKRCopyWith<OKR> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OKRCopyWith<$Res> {
  factory $OKRCopyWith(OKR value, $Res Function(OKR) then) =
      _$OKRCopyWithImpl<$Res, OKR>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? unitId,
      String? process,
      int? totalObjective,
      int? totalKR,
      int? totalTask,
      List<Objective>? objectives});
}

/// @nodoc
class _$OKRCopyWithImpl<$Res, $Val extends OKR> implements $OKRCopyWith<$Res> {
  _$OKRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? unitId = freezed,
    Object? process = freezed,
    Object? totalObjective = freezed,
    Object? totalKR = freezed,
    Object? totalTask = freezed,
    Object? objectives = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      process: freezed == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as String?,
      totalObjective: freezed == totalObjective
          ? _value.totalObjective
          : totalObjective // ignore: cast_nullable_to_non_nullable
              as int?,
      totalKR: freezed == totalKR
          ? _value.totalKR
          : totalKR // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTask: freezed == totalTask
          ? _value.totalTask
          : totalTask // ignore: cast_nullable_to_non_nullable
              as int?,
      objectives: freezed == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<Objective>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OKRCopyWith<$Res> implements $OKRCopyWith<$Res> {
  factory _$$_OKRCopyWith(_$_OKR value, $Res Function(_$_OKR) then) =
      __$$_OKRCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? unitId,
      String? process,
      int? totalObjective,
      int? totalKR,
      int? totalTask,
      List<Objective>? objectives});
}

/// @nodoc
class __$$_OKRCopyWithImpl<$Res> extends _$OKRCopyWithImpl<$Res, _$_OKR>
    implements _$$_OKRCopyWith<$Res> {
  __$$_OKRCopyWithImpl(_$_OKR _value, $Res Function(_$_OKR) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? unitId = freezed,
    Object? process = freezed,
    Object? totalObjective = freezed,
    Object? totalKR = freezed,
    Object? totalTask = freezed,
    Object? objectives = freezed,
  }) {
    return _then(_$_OKR(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      process: freezed == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as String?,
      totalObjective: freezed == totalObjective
          ? _value.totalObjective
          : totalObjective // ignore: cast_nullable_to_non_nullable
              as int?,
      totalKR: freezed == totalKR
          ? _value.totalKR
          : totalKR // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTask: freezed == totalTask
          ? _value.totalTask
          : totalTask // ignore: cast_nullable_to_non_nullable
              as int?,
      objectives: freezed == objectives
          ? _value._objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<Objective>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OKR implements _OKR {
  _$_OKR(
      {this.id,
      this.name,
      this.description,
      this.unitId,
      this.process,
      this.totalObjective,
      this.totalKR,
      this.totalTask,
      final List<Objective>? objectives})
      : _objectives = objectives;

  factory _$_OKR.fromJson(Map<String, dynamic> json) => _$$_OKRFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? unitId;
  @override
  final String? process;
  @override
  final int? totalObjective;
  @override
  final int? totalKR;
  @override
  final int? totalTask;
  final List<Objective>? _objectives;
  @override
  List<Objective>? get objectives {
    final value = _objectives;
    if (value == null) return null;
    if (_objectives is EqualUnmodifiableListView) return _objectives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OKR(id: $id, name: $name, description: $description, unitId: $unitId, process: $process, totalObjective: $totalObjective, totalKR: $totalKR, totalTask: $totalTask, objectives: $objectives)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OKR &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.process, process) || other.process == process) &&
            (identical(other.totalObjective, totalObjective) ||
                other.totalObjective == totalObjective) &&
            (identical(other.totalKR, totalKR) || other.totalKR == totalKR) &&
            (identical(other.totalTask, totalTask) ||
                other.totalTask == totalTask) &&
            const DeepCollectionEquality()
                .equals(other._objectives, _objectives));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      unitId,
      process,
      totalObjective,
      totalKR,
      totalTask,
      const DeepCollectionEquality().hash(_objectives));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OKRCopyWith<_$_OKR> get copyWith =>
      __$$_OKRCopyWithImpl<_$_OKR>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OKRToJson(
      this,
    );
  }
}

abstract class _OKR implements OKR {
  factory _OKR(
      {final String? id,
      final String? name,
      final String? description,
      final String? unitId,
      final String? process,
      final int? totalObjective,
      final int? totalKR,
      final int? totalTask,
      final List<Objective>? objectives}) = _$_OKR;

  factory _OKR.fromJson(Map<String, dynamic> json) = _$_OKR.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get unitId;
  @override
  String? get process;
  @override
  int? get totalObjective;
  @override
  int? get totalKR;
  @override
  int? get totalTask;
  @override
  List<Objective>? get objectives;
  @override
  @JsonKey(ignore: true)
  _$$_OKRCopyWith<_$_OKR> get copyWith => throw _privateConstructorUsedError;
}
