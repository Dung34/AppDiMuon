// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_skill_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListSkillResponse _$ListSkillResponseFromJson(Map<String, dynamic> json) {
  return _ListSkillResponse.fromJson(json);
}

/// @nodoc
mixin _$ListSkillResponse {
  List<Skill>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListSkillResponseCopyWith<ListSkillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSkillResponseCopyWith<$Res> {
  factory $ListSkillResponseCopyWith(
          ListSkillResponse value, $Res Function(ListSkillResponse) then) =
      _$ListSkillResponseCopyWithImpl<$Res, ListSkillResponse>;
  @useResult
  $Res call({List<Skill>? data, int? totalCount});
}

/// @nodoc
class _$ListSkillResponseCopyWithImpl<$Res, $Val extends ListSkillResponse>
    implements $ListSkillResponseCopyWith<$Res> {
  _$ListSkillResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_ListSkillResponseCopyWith<$Res>
    implements $ListSkillResponseCopyWith<$Res> {
  factory _$$_ListSkillResponseCopyWith(_$_ListSkillResponse value,
          $Res Function(_$_ListSkillResponse) then) =
      __$$_ListSkillResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Skill>? data, int? totalCount});
}

/// @nodoc
class __$$_ListSkillResponseCopyWithImpl<$Res>
    extends _$ListSkillResponseCopyWithImpl<$Res, _$_ListSkillResponse>
    implements _$$_ListSkillResponseCopyWith<$Res> {
  __$$_ListSkillResponseCopyWithImpl(
      _$_ListSkillResponse _value, $Res Function(_$_ListSkillResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_ListSkillResponse(
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
class _$_ListSkillResponse implements _ListSkillResponse {
  _$_ListSkillResponse({final List<Skill>? data, this.totalCount})
      : _data = data;

  factory _$_ListSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListSkillResponseFromJson(json);

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
    return 'ListSkillResponse(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListSkillResponse &&
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
  _$$_ListSkillResponseCopyWith<_$_ListSkillResponse> get copyWith =>
      __$$_ListSkillResponseCopyWithImpl<_$_ListSkillResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListSkillResponseToJson(
      this,
    );
  }
}

abstract class _ListSkillResponse implements ListSkillResponse {
  factory _ListSkillResponse({final List<Skill>? data, final int? totalCount}) =
      _$_ListSkillResponse;

  factory _ListSkillResponse.fromJson(Map<String, dynamic> json) =
      _$_ListSkillResponse.fromJson;

  @override
  List<Skill>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_ListSkillResponseCopyWith<_$_ListSkillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
