// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralReport _$GeneralReportFromJson(Map<String, dynamic> json) {
  return _GeneralReport.fromJson(json);
}

/// @nodoc
mixin _$GeneralReport {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get dateTo => throw _privateConstructorUsedError;
  String? get dateFrom => throw _privateConstructorUsedError;
  String? get workDone => throw _privateConstructorUsedError;
  String? get issue => throw _privateConstructorUsedError;
  String? get add => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralReportCopyWith<GeneralReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralReportCopyWith<$Res> {
  factory $GeneralReportCopyWith(
          GeneralReport value, $Res Function(GeneralReport) then) =
      _$GeneralReportCopyWithImpl<$Res, GeneralReport>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? dateTo,
      String? dateFrom,
      String? workDone,
      String? issue,
      String? add});
}

/// @nodoc
class _$GeneralReportCopyWithImpl<$Res, $Val extends GeneralReport>
    implements $GeneralReportCopyWith<$Res> {
  _$GeneralReportCopyWithImpl(this._value, this._then);

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
    Object? dateTo = freezed,
    Object? dateFrom = freezed,
    Object? workDone = freezed,
    Object? issue = freezed,
    Object? add = freezed,
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
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      workDone: freezed == workDone
          ? _value.workDone
          : workDone // ignore: cast_nullable_to_non_nullable
              as String?,
      issue: freezed == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String?,
      add: freezed == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralReportImplCopyWith<$Res>
    implements $GeneralReportCopyWith<$Res> {
  factory _$$GeneralReportImplCopyWith(
          _$GeneralReportImpl value, $Res Function(_$GeneralReportImpl) then) =
      __$$GeneralReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      String? dateTo,
      String? dateFrom,
      String? workDone,
      String? issue,
      String? add});
}

/// @nodoc
class __$$GeneralReportImplCopyWithImpl<$Res>
    extends _$GeneralReportCopyWithImpl<$Res, _$GeneralReportImpl>
    implements _$$GeneralReportImplCopyWith<$Res> {
  __$$GeneralReportImplCopyWithImpl(
      _$GeneralReportImpl _value, $Res Function(_$GeneralReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dateTo = freezed,
    Object? dateFrom = freezed,
    Object? workDone = freezed,
    Object? issue = freezed,
    Object? add = freezed,
  }) {
    return _then(_$GeneralReportImpl(
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
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      workDone: freezed == workDone
          ? _value.workDone
          : workDone // ignore: cast_nullable_to_non_nullable
              as String?,
      issue: freezed == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String?,
      add: freezed == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralReportImpl implements _GeneralReport {
  _$GeneralReportImpl(
      {this.id,
      this.title,
      this.description,
      this.dateTo,
      this.dateFrom,
      this.workDone,
      this.issue,
      this.add});

  factory _$GeneralReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralReportImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? dateTo;
  @override
  final String? dateFrom;
  @override
  final String? workDone;
  @override
  final String? issue;
  @override
  final String? add;

  @override
  String toString() {
    return 'GeneralReport(id: $id, title: $title, description: $description, dateTo: $dateTo, dateFrom: $dateFrom, workDone: $workDone, issue: $issue, add: $add)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.workDone, workDone) ||
                other.workDone == workDone) &&
            (identical(other.issue, issue) || other.issue == issue) &&
            (identical(other.add, add) || other.add == add));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dateTo,
      dateFrom, workDone, issue, add);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralReportImplCopyWith<_$GeneralReportImpl> get copyWith =>
      __$$GeneralReportImplCopyWithImpl<_$GeneralReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralReportImplToJson(
      this,
    );
  }
}

abstract class _GeneralReport implements GeneralReport {
  factory _GeneralReport(
      {final String? id,
      final String? title,
      final String? description,
      final String? dateTo,
      final String? dateFrom,
      final String? workDone,
      final String? issue,
      final String? add}) = _$GeneralReportImpl;

  factory _GeneralReport.fromJson(Map<String, dynamic> json) =
      _$GeneralReportImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get dateTo;
  @override
  String? get dateFrom;
  @override
  String? get workDone;
  @override
  String? get issue;
  @override
  String? get add;
  @override
  @JsonKey(ignore: true)
  _$$GeneralReportImplCopyWith<_$GeneralReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
