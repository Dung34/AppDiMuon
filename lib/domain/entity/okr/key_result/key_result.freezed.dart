// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeyResult _$KeyResultFromJson(Map<String, dynamic> json) {
  return _KeyResult.fromJson(json);
}

/// @nodoc
mixin _$KeyResult {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get target => throw _privateConstructorUsedError;
  double? get actual => throw _privateConstructorUsedError;
  String? get objectiveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyResultCopyWith<KeyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyResultCopyWith<$Res> {
  factory $KeyResultCopyWith(KeyResult value, $Res Function(KeyResult) then) =
      _$KeyResultCopyWithImpl<$Res, KeyResult>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      double? target,
      double? actual,
      String? objectiveId});
}

/// @nodoc
class _$KeyResultCopyWithImpl<$Res, $Val extends KeyResult>
    implements $KeyResultCopyWith<$Res> {
  _$KeyResultCopyWithImpl(this._value, this._then);

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
    Object? target = freezed,
    Object? actual = freezed,
    Object? objectiveId = freezed,
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
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
      actual: freezed == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as double?,
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeyResultCopyWith<$Res> implements $KeyResultCopyWith<$Res> {
  factory _$$_KeyResultCopyWith(
          _$_KeyResult value, $Res Function(_$_KeyResult) then) =
      __$$_KeyResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      double? target,
      double? actual,
      String? objectiveId});
}

/// @nodoc
class __$$_KeyResultCopyWithImpl<$Res>
    extends _$KeyResultCopyWithImpl<$Res, _$_KeyResult>
    implements _$$_KeyResultCopyWith<$Res> {
  __$$_KeyResultCopyWithImpl(
      _$_KeyResult _value, $Res Function(_$_KeyResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? target = freezed,
    Object? actual = freezed,
    Object? objectiveId = freezed,
  }) {
    return _then(_$_KeyResult(
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
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
      actual: freezed == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as double?,
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyResult implements _KeyResult {
  _$_KeyResult(
      {this.id,
      this.title,
      this.description,
      this.target,
      this.actual,
      this.objectiveId});

  factory _$_KeyResult.fromJson(Map<String, dynamic> json) =>
      _$$_KeyResultFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final double? target;
  @override
  final double? actual;
  @override
  final String? objectiveId;

  @override
  String toString() {
    return 'KeyResult(id: $id, title: $title, description: $description, target: $target, actual: $actual, objectiveId: $objectiveId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.actual, actual) || other.actual == actual) &&
            (identical(other.objectiveId, objectiveId) ||
                other.objectiveId == objectiveId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, target, actual, objectiveId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeyResultCopyWith<_$_KeyResult> get copyWith =>
      __$$_KeyResultCopyWithImpl<_$_KeyResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyResultToJson(
      this,
    );
  }
}

abstract class _KeyResult implements KeyResult {
  factory _KeyResult(
      {final String? id,
      final String? title,
      final String? description,
      final double? target,
      final double? actual,
      final String? objectiveId}) = _$_KeyResult;

  factory _KeyResult.fromJson(Map<String, dynamic> json) =
      _$_KeyResult.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  double? get target;
  @override
  double? get actual;
  @override
  String? get objectiveId;
  @override
  @JsonKey(ignore: true)
  _$$_KeyResultCopyWith<_$_KeyResult> get copyWith =>
      throw _privateConstructorUsedError;
}
