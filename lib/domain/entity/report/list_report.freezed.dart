// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListReport _$ListReportFromJson(Map<String, dynamic> json) {
  return _ListReport.fromJson(json);
}

/// @nodoc
mixin _$ListReport {
  List<ReportDaily>? get data => throw _privateConstructorUsedError;
  int? get totalcount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListReportCopyWith<ListReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListReportCopyWith<$Res> {
  factory $ListReportCopyWith(
          ListReport value, $Res Function(ListReport) then) =
      _$ListReportCopyWithImpl<$Res, ListReport>;
  @useResult
  $Res call({List<ReportDaily>? data, int? totalcount});
}

/// @nodoc
class _$ListReportCopyWithImpl<$Res, $Val extends ListReport>
    implements $ListReportCopyWith<$Res> {
  _$ListReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalcount = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportDaily>?,
      totalcount: freezed == totalcount
          ? _value.totalcount
          : totalcount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListReportImplCopyWith<$Res>
    implements $ListReportCopyWith<$Res> {
  factory _$$ListReportImplCopyWith(
          _$ListReportImpl value, $Res Function(_$ListReportImpl) then) =
      __$$ListReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReportDaily>? data, int? totalcount});
}

/// @nodoc
class __$$ListReportImplCopyWithImpl<$Res>
    extends _$ListReportCopyWithImpl<$Res, _$ListReportImpl>
    implements _$$ListReportImplCopyWith<$Res> {
  __$$ListReportImplCopyWithImpl(
      _$ListReportImpl _value, $Res Function(_$ListReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalcount = freezed,
  }) {
    return _then(_$ListReportImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportDaily>?,
      totalcount: freezed == totalcount
          ? _value.totalcount
          : totalcount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListReportImpl implements _ListReport {
  _$ListReportImpl({final List<ReportDaily>? data, this.totalcount})
      : _data = data;

  factory _$ListReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListReportImplFromJson(json);

  final List<ReportDaily>? _data;
  @override
  List<ReportDaily>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalcount;

  @override
  String toString() {
    return 'ListReport(data: $data, totalcount: $totalcount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListReportImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalcount, totalcount) ||
                other.totalcount == totalcount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), totalcount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListReportImplCopyWith<_$ListReportImpl> get copyWith =>
      __$$ListReportImplCopyWithImpl<_$ListReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListReportImplToJson(
      this,
    );
  }
}

abstract class _ListReport implements ListReport {
  factory _ListReport({final List<ReportDaily>? data, final int? totalcount}) =
      _$ListReportImpl;

  factory _ListReport.fromJson(Map<String, dynamic> json) =
      _$ListReportImpl.fromJson;

  @override
  List<ReportDaily>? get data;
  @override
  int? get totalcount;
  @override
  @JsonKey(ignore: true)
  _$$ListReportImplCopyWith<_$ListReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
