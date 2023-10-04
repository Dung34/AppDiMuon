// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitList _$UnitListFromJson(Map<String, dynamic> json) {
  return _UnitList.fromJson(json);
}

/// @nodoc
mixin _$UnitList {
  List<Unit>? get unitList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitListCopyWith<UnitList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitListCopyWith<$Res> {
  factory $UnitListCopyWith(UnitList value, $Res Function(UnitList) then) =
      _$UnitListCopyWithImpl<$Res, UnitList>;
  @useResult
  $Res call({List<Unit>? unitList});
}

/// @nodoc
class _$UnitListCopyWithImpl<$Res, $Val extends UnitList>
    implements $UnitListCopyWith<$Res> {
  _$UnitListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitList = freezed,
  }) {
    return _then(_value.copyWith(
      unitList: freezed == unitList
          ? _value.unitList
          : unitList // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitListCopyWith<$Res> implements $UnitListCopyWith<$Res> {
  factory _$$_UnitListCopyWith(
          _$_UnitList value, $Res Function(_$_UnitList) then) =
      __$$_UnitListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Unit>? unitList});
}

/// @nodoc
class __$$_UnitListCopyWithImpl<$Res>
    extends _$UnitListCopyWithImpl<$Res, _$_UnitList>
    implements _$$_UnitListCopyWith<$Res> {
  __$$_UnitListCopyWithImpl(
      _$_UnitList _value, $Res Function(_$_UnitList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitList = freezed,
  }) {
    return _then(_$_UnitList(
      unitList: freezed == unitList
          ? _value._unitList
          : unitList // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitList implements _UnitList {
  _$_UnitList({final List<Unit>? unitList}) : _unitList = unitList;

  factory _$_UnitList.fromJson(Map<String, dynamic> json) =>
      _$$_UnitListFromJson(json);

  final List<Unit>? _unitList;
  @override
  List<Unit>? get unitList {
    final value = _unitList;
    if (value == null) return null;
    if (_unitList is EqualUnmodifiableListView) return _unitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UnitList(unitList: $unitList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitList &&
            const DeepCollectionEquality().equals(other._unitList, _unitList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_unitList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitListCopyWith<_$_UnitList> get copyWith =>
      __$$_UnitListCopyWithImpl<_$_UnitList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitListToJson(
      this,
    );
  }
}

abstract class _UnitList implements UnitList {
  factory _UnitList({final List<Unit>? unitList}) = _$_UnitList;

  factory _UnitList.fromJson(Map<String, dynamic> json) = _$_UnitList.fromJson;

  @override
  List<Unit>? get unitList;
  @override
  @JsonKey(ignore: true)
  _$$_UnitListCopyWith<_$_UnitList> get copyWith =>
      throw _privateConstructorUsedError;
}
