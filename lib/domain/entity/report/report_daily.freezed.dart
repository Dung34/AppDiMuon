// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_daily.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportDaily _$ReportDailyFromJson(Map<String, dynamic> json) {
  return _ReportDaily.fromJson(json);
}

/// @nodoc
mixin _$ReportDaily {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDailyCopyWith<ReportDaily> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDailyCopyWith<$Res> {
  factory $ReportDailyCopyWith(
          ReportDaily value, $Res Function(ReportDaily) then) =
      _$ReportDailyCopyWithImpl<$Res, ReportDaily>;
  @useResult
  $Res call({String? id, String? title, String? description, String? date});
}

/// @nodoc
class _$ReportDailyCopyWithImpl<$Res, $Val extends ReportDaily>
    implements $ReportDailyCopyWith<$Res> {
  _$ReportDailyCopyWithImpl(this._value, this._then);

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
    Object? date = freezed,
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDailyImplCopyWith<$Res>
    implements $ReportDailyCopyWith<$Res> {
  factory _$$ReportDailyImplCopyWith(
          _$ReportDailyImpl value, $Res Function(_$ReportDailyImpl) then) =
      __$$ReportDailyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, String? description, String? date});
}

/// @nodoc
class __$$ReportDailyImplCopyWithImpl<$Res>
    extends _$ReportDailyCopyWithImpl<$Res, _$ReportDailyImpl>
    implements _$$ReportDailyImplCopyWith<$Res> {
  __$$ReportDailyImplCopyWithImpl(
      _$ReportDailyImpl _value, $Res Function(_$ReportDailyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = freezed,
  }) {
    return _then(_$ReportDailyImpl(
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDailyImpl implements _ReportDaily {
  _$ReportDailyImpl({this.id, this.title, this.description, this.date});

  factory _$ReportDailyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDailyImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? date;

  @override
  String toString() {
    return 'ReportDaily(id: $id, title: $title, description: $description, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDailyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDailyImplCopyWith<_$ReportDailyImpl> get copyWith =>
      __$$ReportDailyImplCopyWithImpl<_$ReportDailyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDailyImplToJson(
      this,
    );
  }
}

abstract class _ReportDaily implements ReportDaily {
  factory _ReportDaily(
      {final String? id,
      final String? title,
      final String? description,
      final String? date}) = _$ReportDailyImpl;

  factory _ReportDaily.fromJson(Map<String, dynamic> json) =
      _$ReportDailyImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$ReportDailyImplCopyWith<_$ReportDailyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
