// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckinStatistic _$CheckinStatisticFromJson(Map<String, dynamic> json) {
  return _CheckinStatistic.fromJson(json);
}

/// @nodoc
mixin _$CheckinStatistic {
  String? get dateNow => throw _privateConstructorUsedError;
  int? get workDay => throw _privateConstructorUsedError;
  int? get lateDay => throw _privateConstructorUsedError;
  int? get leaveDay => throw _privateConstructorUsedError;
  List<String>? get listEventCheckin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckinStatisticCopyWith<CheckinStatistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinStatisticCopyWith<$Res> {
  factory $CheckinStatisticCopyWith(
          CheckinStatistic value, $Res Function(CheckinStatistic) then) =
      _$CheckinStatisticCopyWithImpl<$Res, CheckinStatistic>;
  @useResult
  $Res call(
      {String? dateNow,
      int? workDay,
      int? lateDay,
      int? leaveDay,
      List<String>? listEventCheckin});
}

/// @nodoc
class _$CheckinStatisticCopyWithImpl<$Res, $Val extends CheckinStatistic>
    implements $CheckinStatisticCopyWith<$Res> {
  _$CheckinStatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateNow = freezed,
    Object? workDay = freezed,
    Object? lateDay = freezed,
    Object? leaveDay = freezed,
    Object? listEventCheckin = freezed,
  }) {
    return _then(_value.copyWith(
      dateNow: freezed == dateNow
          ? _value.dateNow
          : dateNow // ignore: cast_nullable_to_non_nullable
              as String?,
      workDay: freezed == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int?,
      lateDay: freezed == lateDay
          ? _value.lateDay
          : lateDay // ignore: cast_nullable_to_non_nullable
              as int?,
      leaveDay: freezed == leaveDay
          ? _value.leaveDay
          : leaveDay // ignore: cast_nullable_to_non_nullable
              as int?,
      listEventCheckin: freezed == listEventCheckin
          ? _value.listEventCheckin
          : listEventCheckin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckinStatisticImplCopyWith<$Res>
    implements $CheckinStatisticCopyWith<$Res> {
  factory _$$CheckinStatisticImplCopyWith(_$CheckinStatisticImpl value,
          $Res Function(_$CheckinStatisticImpl) then) =
      __$$CheckinStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dateNow,
      int? workDay,
      int? lateDay,
      int? leaveDay,
      List<String>? listEventCheckin});
}

/// @nodoc
class __$$CheckinStatisticImplCopyWithImpl<$Res>
    extends _$CheckinStatisticCopyWithImpl<$Res, _$CheckinStatisticImpl>
    implements _$$CheckinStatisticImplCopyWith<$Res> {
  __$$CheckinStatisticImplCopyWithImpl(_$CheckinStatisticImpl _value,
      $Res Function(_$CheckinStatisticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateNow = freezed,
    Object? workDay = freezed,
    Object? lateDay = freezed,
    Object? leaveDay = freezed,
    Object? listEventCheckin = freezed,
  }) {
    return _then(_$CheckinStatisticImpl(
      freezed == dateNow
          ? _value.dateNow
          : dateNow // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == lateDay
          ? _value.lateDay
          : lateDay // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == leaveDay
          ? _value.leaveDay
          : leaveDay // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == listEventCheckin
          ? _value._listEventCheckin
          : listEventCheckin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckinStatisticImpl implements _CheckinStatistic {
  _$CheckinStatisticImpl(this.dateNow, this.workDay, this.lateDay,
      this.leaveDay, final List<String>? listEventCheckin)
      : _listEventCheckin = listEventCheckin;

  factory _$CheckinStatisticImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckinStatisticImplFromJson(json);

  @override
  final String? dateNow;
  @override
  final int? workDay;
  @override
  final int? lateDay;
  @override
  final int? leaveDay;
  final List<String>? _listEventCheckin;
  @override
  List<String>? get listEventCheckin {
    final value = _listEventCheckin;
    if (value == null) return null;
    if (_listEventCheckin is EqualUnmodifiableListView)
      return _listEventCheckin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CheckinStatistic(dateNow: $dateNow, workDay: $workDay, lateDay: $lateDay, leaveDay: $leaveDay, listEventCheckin: $listEventCheckin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinStatisticImpl &&
            (identical(other.dateNow, dateNow) || other.dateNow == dateNow) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.lateDay, lateDay) || other.lateDay == lateDay) &&
            (identical(other.leaveDay, leaveDay) ||
                other.leaveDay == leaveDay) &&
            const DeepCollectionEquality()
                .equals(other._listEventCheckin, _listEventCheckin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateNow, workDay, lateDay,
      leaveDay, const DeepCollectionEquality().hash(_listEventCheckin));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinStatisticImplCopyWith<_$CheckinStatisticImpl> get copyWith =>
      __$$CheckinStatisticImplCopyWithImpl<_$CheckinStatisticImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckinStatisticImplToJson(
      this,
    );
  }
}

abstract class _CheckinStatistic implements CheckinStatistic {
  factory _CheckinStatistic(
      final String? dateNow,
      final int? workDay,
      final int? lateDay,
      final int? leaveDay,
      final List<String>? listEventCheckin) = _$CheckinStatisticImpl;

  factory _CheckinStatistic.fromJson(Map<String, dynamic> json) =
      _$CheckinStatisticImpl.fromJson;

  @override
  String? get dateNow;
  @override
  int? get workDay;
  @override
  int? get lateDay;
  @override
  int? get leaveDay;
  @override
  List<String>? get listEventCheckin;
  @override
  @JsonKey(ignore: true)
  _$$CheckinStatisticImplCopyWith<_$CheckinStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
