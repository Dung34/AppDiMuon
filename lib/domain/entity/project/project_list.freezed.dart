// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectList _$ProjectListFromJson(Map<String, dynamic> json) {
  return _ProjectList.fromJson(json);
}

/// @nodoc
mixin _$ProjectList {
  List<Project>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectListCopyWith<ProjectList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectListCopyWith<$Res> {
  factory $ProjectListCopyWith(
          ProjectList value, $Res Function(ProjectList) then) =
      _$ProjectListCopyWithImpl<$Res, ProjectList>;
  @useResult
  $Res call({List<Project>? data, int? totalCount});
}

/// @nodoc
class _$ProjectListCopyWithImpl<$Res, $Val extends ProjectList>
    implements $ProjectListCopyWith<$Res> {
  _$ProjectListCopyWithImpl(this._value, this._then);

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
              as List<Project>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectListCopyWith<$Res>
    implements $ProjectListCopyWith<$Res> {
  factory _$$_ProjectListCopyWith(
          _$_ProjectList value, $Res Function(_$_ProjectList) then) =
      __$$_ProjectListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Project>? data, int? totalCount});
}

/// @nodoc
class __$$_ProjectListCopyWithImpl<$Res>
    extends _$ProjectListCopyWithImpl<$Res, _$_ProjectList>
    implements _$$_ProjectListCopyWith<$Res> {
  __$$_ProjectListCopyWithImpl(
      _$_ProjectList _value, $Res Function(_$_ProjectList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_ProjectList(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Project>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectList implements _ProjectList {
  _$_ProjectList({final List<Project>? data, this.totalCount}) : _data = data;

  factory _$_ProjectList.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectListFromJson(json);

  final List<Project>? _data;
  @override
  List<Project>? get data {
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
    return 'ProjectList(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectList &&
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
  _$$_ProjectListCopyWith<_$_ProjectList> get copyWith =>
      __$$_ProjectListCopyWithImpl<_$_ProjectList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectListToJson(
      this,
    );
  }
}

abstract class _ProjectList implements ProjectList {
  factory _ProjectList({final List<Project>? data, final int? totalCount}) =
      _$_ProjectList;

  factory _ProjectList.fromJson(Map<String, dynamic> json) =
      _$_ProjectList.fromJson;

  @override
  List<Project>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectListCopyWith<_$_ProjectList> get copyWith =>
      throw _privateConstructorUsedError;
}
