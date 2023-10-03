// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListTarget _$ListTargetFromJson(Map<String, dynamic> json) {
  return _ListTarget.fromJson(json);
}

/// @nodoc
mixin _$ListTarget {
  List<Target>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListTargetCopyWith<ListTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTargetCopyWith<$Res> {
  factory $ListTargetCopyWith(
          ListTarget value, $Res Function(ListTarget) then) =
      _$ListTargetCopyWithImpl<$Res, ListTarget>;
  @useResult
  $Res call({List<Target>? data, int? totalCount});
}

/// @nodoc
class _$ListTargetCopyWithImpl<$Res, $Val extends ListTarget>
    implements $ListTargetCopyWith<$Res> {
  _$ListTargetCopyWithImpl(this._value, this._then);

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
              as List<Target>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListTargetCopyWith<$Res>
    implements $ListTargetCopyWith<$Res> {
  factory _$$_ListTargetCopyWith(
          _$_ListTarget value, $Res Function(_$_ListTarget) then) =
      __$$_ListTargetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Target>? data, int? totalCount});
}

/// @nodoc
class __$$_ListTargetCopyWithImpl<$Res>
    extends _$ListTargetCopyWithImpl<$Res, _$_ListTarget>
    implements _$$_ListTargetCopyWith<$Res> {
  __$$_ListTargetCopyWithImpl(
      _$_ListTarget _value, $Res Function(_$_ListTarget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_ListTarget(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Target>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListTarget implements _ListTarget {
  _$_ListTarget({final List<Target>? data, this.totalCount}) : _data = data;

  factory _$_ListTarget.fromJson(Map<String, dynamic> json) =>
      _$$_ListTargetFromJson(json);

  final List<Target>? _data;
  @override
  List<Target>? get data {
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
    return 'ListTarget(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListTarget &&
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
  _$$_ListTargetCopyWith<_$_ListTarget> get copyWith =>
      __$$_ListTargetCopyWithImpl<_$_ListTarget>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListTargetToJson(
      this,
    );
  }
}

abstract class _ListTarget implements ListTarget {
  factory _ListTarget({final List<Target>? data, final int? totalCount}) =
      _$_ListTarget;

  factory _ListTarget.fromJson(Map<String, dynamic> json) =
      _$_ListTarget.fromJson;

  @override
  List<Target>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_ListTargetCopyWith<_$_ListTarget> get copyWith =>
      throw _privateConstructorUsedError;
}
