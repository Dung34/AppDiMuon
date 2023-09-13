// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralReportResponse _$GeneralReportResponseFromJson(
    Map<String, dynamic> json) {
  return _GeneralReportResponse.fromJson(json);
}

/// @nodoc
mixin _$GeneralReportResponse {
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
  $GeneralReportResponseCopyWith<GeneralReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralReportResponseCopyWith<$Res> {
  factory $GeneralReportResponseCopyWith(GeneralReportResponse value,
          $Res Function(GeneralReportResponse) then) =
      _$GeneralReportResponseCopyWithImpl<$Res, GeneralReportResponse>;
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
class _$GeneralReportResponseCopyWithImpl<$Res,
        $Val extends GeneralReportResponse>
    implements $GeneralReportResponseCopyWith<$Res> {
  _$GeneralReportResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_GeneralReportResponseCopyWith<$Res>
    implements $GeneralReportResponseCopyWith<$Res> {
  factory _$$_GeneralReportResponseCopyWith(_$_GeneralReportResponse value,
          $Res Function(_$_GeneralReportResponse) then) =
      __$$_GeneralReportResponseCopyWithImpl<$Res>;
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
class __$$_GeneralReportResponseCopyWithImpl<$Res>
    extends _$GeneralReportResponseCopyWithImpl<$Res, _$_GeneralReportResponse>
    implements _$$_GeneralReportResponseCopyWith<$Res> {
  __$$_GeneralReportResponseCopyWithImpl(_$_GeneralReportResponse _value,
      $Res Function(_$_GeneralReportResponse) _then)
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
    return _then(_$_GeneralReportResponse(
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
class _$_GeneralReportResponse implements _GeneralReportResponse {
  _$_GeneralReportResponse(
      {this.id,
      this.title,
      this.description,
      this.dateTo,
      this.dateFrom,
      this.workDone,
      this.issue,
      this.add});

  factory _$_GeneralReportResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralReportResponseFromJson(json);

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
    return 'GeneralReportResponse(id: $id, title: $title, description: $description, dateTo: $dateTo, dateFrom: $dateFrom, workDone: $workDone, issue: $issue, add: $add)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralReportResponse &&
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
  _$$_GeneralReportResponseCopyWith<_$_GeneralReportResponse> get copyWith =>
      __$$_GeneralReportResponseCopyWithImpl<_$_GeneralReportResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralReportResponseToJson(
      this,
    );
  }
}

abstract class _GeneralReportResponse implements GeneralReportResponse {
  factory _GeneralReportResponse(
      {final String? id,
      final String? title,
      final String? description,
      final String? dateTo,
      final String? dateFrom,
      final String? workDone,
      final String? issue,
      final String? add}) = _$_GeneralReportResponse;

  factory _GeneralReportResponse.fromJson(Map<String, dynamic> json) =
      _$_GeneralReportResponse.fromJson;

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
  _$$_GeneralReportResponseCopyWith<_$_GeneralReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
