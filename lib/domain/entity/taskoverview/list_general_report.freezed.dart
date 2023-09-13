// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_general_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListGeneralReport _$ListGeneralReportFromJson(Map<String, dynamic> json) {
  return _ListGeneralReport.fromJson(json);
}

/// @nodoc
mixin _$ListGeneralReport {
  List<GeneralReport>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListGeneralReportCopyWith<ListGeneralReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListGeneralReportCopyWith<$Res> {
  factory $ListGeneralReportCopyWith(
          ListGeneralReport value, $Res Function(ListGeneralReport) then) =
      _$ListGeneralReportCopyWithImpl<$Res, ListGeneralReport>;
  @useResult
  $Res call({List<GeneralReport>? data, int? totalCount});
}

/// @nodoc
class _$ListGeneralReportCopyWithImpl<$Res, $Val extends ListGeneralReport>
    implements $ListGeneralReportCopyWith<$Res> {
  _$ListGeneralReportCopyWithImpl(this._value, this._then);

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
abstract class _$$_ListGeneralReportCopyWith<$Res>
    implements $ListGeneralReportCopyWith<$Res> {
  factory _$$_ListGeneralReportCopyWith(_$_ListGeneralReport value,
          $Res Function(_$_ListGeneralReport) then) =
      __$$_ListGeneralReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GeneralReport>? data, int? totalCount});
}

/// @nodoc
class __$$_ListGeneralReportCopyWithImpl<$Res>
    extends _$ListGeneralReportCopyWithImpl<$Res, _$_ListGeneralReport>
    implements _$$_ListGeneralReportCopyWith<$Res> {
  __$$_ListGeneralReportCopyWithImpl(
      _$_ListGeneralReport _value, $Res Function(_$_ListGeneralReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_ListGeneralReport(
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
class _$_ListGeneralReport implements _ListGeneralReport {
  _$_ListGeneralReport({final List<GeneralReport>? data, this.totalCount})
      : _data = data;

  factory _$_ListGeneralReport.fromJson(Map<String, dynamic> json) =>
      _$$_ListGeneralReportFromJson(json);

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
    return 'ListGeneralReport(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListGeneralReport &&
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
  _$$_ListGeneralReportCopyWith<_$_ListGeneralReport> get copyWith =>
      __$$_ListGeneralReportCopyWithImpl<_$_ListGeneralReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListGeneralReportToJson(
      this,
    );
  }
}

abstract class _ListGeneralReport implements ListGeneralReport {
  factory _ListGeneralReport(
      {final List<GeneralReport>? data,
      final int? totalCount}) = _$_ListGeneralReport;

  factory _ListGeneralReport.fromJson(Map<String, dynamic> json) =
      _$_ListGeneralReport.fromJson;

  @override
  List<GeneralReport>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_ListGeneralReportCopyWith<_$_ListGeneralReport> get copyWith =>
      throw _privateConstructorUsedError;
}
