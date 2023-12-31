// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_general_report_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListGeneralReportRes _$ListGeneralReportResFromJson(Map<String, dynamic> json) {
  return _ListGeneralReportRes.fromJson(json);
}

/// @nodoc
mixin _$ListGeneralReportRes {
  List<GeneralReport>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListGeneralReportResCopyWith<ListGeneralReportRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListGeneralReportResCopyWith<$Res> {
  factory $ListGeneralReportResCopyWith(ListGeneralReportRes value,
          $Res Function(ListGeneralReportRes) then) =
      _$ListGeneralReportResCopyWithImpl<$Res, ListGeneralReportRes>;
  @useResult
  $Res call({List<GeneralReport>? data, int? totalCount});
}

/// @nodoc
class _$ListGeneralReportResCopyWithImpl<$Res,
        $Val extends ListGeneralReportRes>
    implements $ListGeneralReportResCopyWith<$Res> {
  _$ListGeneralReportResCopyWithImpl(this._value, this._then);

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
              as List<GeneralReport>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListGeneralReportResImplCopyWith<$Res>
    implements $ListGeneralReportResCopyWith<$Res> {
  factory _$$ListGeneralReportResImplCopyWith(_$ListGeneralReportResImpl value,
          $Res Function(_$ListGeneralReportResImpl) then) =
      __$$ListGeneralReportResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GeneralReport>? data, int? totalCount});
}

/// @nodoc
class __$$ListGeneralReportResImplCopyWithImpl<$Res>
    extends _$ListGeneralReportResCopyWithImpl<$Res, _$ListGeneralReportResImpl>
    implements _$$ListGeneralReportResImplCopyWith<$Res> {
  __$$ListGeneralReportResImplCopyWithImpl(_$ListGeneralReportResImpl _value,
      $Res Function(_$ListGeneralReportResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$ListGeneralReportResImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GeneralReport>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListGeneralReportResImpl implements _ListGeneralReportRes {
  _$ListGeneralReportResImpl({final List<GeneralReport>? data, this.totalCount})
      : _data = data;

  factory _$ListGeneralReportResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListGeneralReportResImplFromJson(json);

  final List<GeneralReport>? _data;
  @override
  List<GeneralReport>? get data {
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
    return 'ListGeneralReportRes(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListGeneralReportResImpl &&
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
  _$$ListGeneralReportResImplCopyWith<_$ListGeneralReportResImpl>
      get copyWith =>
          __$$ListGeneralReportResImplCopyWithImpl<_$ListGeneralReportResImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListGeneralReportResImplToJson(
      this,
    );
  }
}

abstract class _ListGeneralReportRes implements ListGeneralReportRes {
  factory _ListGeneralReportRes(
      {final List<GeneralReport>? data,
      final int? totalCount}) = _$ListGeneralReportResImpl;

  factory _ListGeneralReportRes.fromJson(Map<String, dynamic> json) =
      _$ListGeneralReportResImpl.fromJson;

  @override
  List<GeneralReport>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$ListGeneralReportResImplCopyWith<_$ListGeneralReportResImpl>
      get copyWith => throw _privateConstructorUsedError;
}
