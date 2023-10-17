// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_skill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListSkill _$ListSkillFromJson(Map<String, dynamic> json) {
  return _ListSkill.fromJson(json);
}

/// @nodoc
mixin _$ListSkill {
  List<Skill>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListSkillCopyWith<ListSkill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSkillCopyWith<$Res> {
  factory $ListSkillCopyWith(ListSkill value, $Res Function(ListSkill) then) =
      _$ListSkillCopyWithImpl<$Res, ListSkill>;
  @useResult
  $Res call({List<Skill>? data, int? totalCount});
}

/// @nodoc
class _$ListSkillCopyWithImpl<$Res, $Val extends ListSkill>
    implements $ListSkillCopyWith<$Res> {
  _$ListSkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Skill>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListSkillImplCopyWith<$Res>
    implements $ListSkillCopyWith<$Res> {
  factory _$$ListSkillImplCopyWith(
          _$ListSkillImpl value, $Res Function(_$ListSkillImpl) then) =
      __$$ListSkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Skill>? data, int? totalCount});
}

/// @nodoc
class __$$ListSkillImplCopyWithImpl<$Res>
    extends _$ListSkillCopyWithImpl<$Res, _$ListSkillImpl>
    implements _$$ListSkillImplCopyWith<$Res> {
  __$$ListSkillImplCopyWithImpl(
      _$ListSkillImpl _value, $Res Function(_$ListSkillImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$ListSkillImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Skill>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListSkillImpl implements _ListSkill {
  _$ListSkillImpl({final List<Skill>? data, this.totalCount}) : _data = data;

  factory _$ListSkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListSkillImplFromJson(json);

  final List<Skill>? _data;
  @override
  List<Skill>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'ListSkill(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSkillImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSkillImplCopyWith<_$ListSkillImpl> get copyWith =>
      __$$ListSkillImplCopyWithImpl<_$ListSkillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListSkillImplToJson(
      this,
    );
  }
}

abstract class _ListSkill implements ListSkill {
  factory _ListSkill({final List<Skill>? data, final int? totalCount}) =
      _$ListSkillImpl;

  factory _ListSkill.fromJson(Map<String, dynamic> json) =
      _$ListSkillImpl.fromJson;

  @override
  List<Skill>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$ListSkillImplCopyWith<_$ListSkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
