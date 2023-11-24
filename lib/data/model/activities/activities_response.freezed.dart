// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) {
  return _ActivityResponse.fromJson(json);
}

/// @nodoc
mixin _$ActivityResponse {
  String? get fullname => throw _privateConstructorUsedError;
  String? get dateTimeAct => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityResponseCopyWith<ActivityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityResponseCopyWith<$Res> {
  factory $ActivityResponseCopyWith(
          ActivityResponse value, $Res Function(ActivityResponse) then) =
      _$ActivityResponseCopyWithImpl<$Res, ActivityResponse>;
  @useResult
  $Res call({String? fullname, String? dateTimeAct, String? action});
}

/// @nodoc
class _$ActivityResponseCopyWithImpl<$Res, $Val extends ActivityResponse>
    implements $ActivityResponseCopyWith<$Res> {
  _$ActivityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = freezed,
    Object? dateTimeAct = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTimeAct: freezed == dateTimeAct
          ? _value.dateTimeAct
          : dateTimeAct // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityResponseImplCopyWith<$Res>
    implements $ActivityResponseCopyWith<$Res> {
  factory _$$ActivityResponseImplCopyWith(_$ActivityResponseImpl value,
          $Res Function(_$ActivityResponseImpl) then) =
      __$$ActivityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fullname, String? dateTimeAct, String? action});
}

/// @nodoc
class __$$ActivityResponseImplCopyWithImpl<$Res>
    extends _$ActivityResponseCopyWithImpl<$Res, _$ActivityResponseImpl>
    implements _$$ActivityResponseImplCopyWith<$Res> {
  __$$ActivityResponseImplCopyWithImpl(_$ActivityResponseImpl _value,
      $Res Function(_$ActivityResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = freezed,
    Object? dateTimeAct = freezed,
    Object? action = freezed,
  }) {
    return _then(_$ActivityResponseImpl(
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTimeAct: freezed == dateTimeAct
          ? _value.dateTimeAct
          : dateTimeAct // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityResponseImpl implements _ActivityResponse {
  _$ActivityResponseImpl({this.fullname, this.dateTimeAct, this.action});

  factory _$ActivityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityResponseImplFromJson(json);

  @override
  final String? fullname;
  @override
  final String? dateTimeAct;
  @override
  final String? action;

  @override
  String toString() {
    return 'ActivityResponse(fullname: $fullname, dateTimeAct: $dateTimeAct, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityResponseImpl &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.dateTimeAct, dateTimeAct) ||
                other.dateTimeAct == dateTimeAct) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullname, dateTimeAct, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityResponseImplCopyWith<_$ActivityResponseImpl> get copyWith =>
      __$$ActivityResponseImplCopyWithImpl<_$ActivityResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityResponseImplToJson(
      this,
    );
  }
}

abstract class _ActivityResponse implements ActivityResponse {
  factory _ActivityResponse(
      {final String? fullname,
      final String? dateTimeAct,
      final String? action}) = _$ActivityResponseImpl;

  factory _ActivityResponse.fromJson(Map<String, dynamic> json) =
      _$ActivityResponseImpl.fromJson;

  @override
  String? get fullname;
  @override
  String? get dateTimeAct;
  @override
  String? get action;
  @override
  @JsonKey(ignore: true)
  _$$ActivityResponseImplCopyWith<_$ActivityResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
