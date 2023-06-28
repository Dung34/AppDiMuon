// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  bool? get concerned => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userFullname => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ConcernedUser>? get concernedUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String? id,
      String? type,
      String? background,
      bool? concerned,
      String? userId,
      String? userFullname,
      String? startTime,
      String? endTime,
      String? description,
      List<ConcernedUser>? concernedUser});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? background = freezed,
    Object? concerned = freezed,
    Object? userId = freezed,
    Object? userFullname = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? concernedUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      concerned: freezed == concerned
          ? _value.concerned
          : concerned // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullname: freezed == userFullname
          ? _value.userFullname
          : userFullname // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      concernedUser: freezed == concernedUser
          ? _value.concernedUser
          : concernedUser // ignore: cast_nullable_to_non_nullable
              as List<ConcernedUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? type,
      String? background,
      bool? concerned,
      String? userId,
      String? userFullname,
      String? startTime,
      String? endTime,
      String? description,
      List<ConcernedUser>? concernedUser});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? background = freezed,
    Object? concerned = freezed,
    Object? userId = freezed,
    Object? userFullname = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? concernedUser = freezed,
  }) {
    return _then(_$_Event(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      concerned: freezed == concerned
          ? _value.concerned
          : concerned // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullname: freezed == userFullname
          ? _value.userFullname
          : userFullname // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      concernedUser: freezed == concernedUser
          ? _value._concernedUser
          : concernedUser // ignore: cast_nullable_to_non_nullable
              as List<ConcernedUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {this.id,
      this.type,
      this.background,
      this.concerned,
      this.userId,
      this.userFullname,
      this.startTime,
      this.endTime,
      this.description,
      final List<ConcernedUser>? concernedUser})
      : _concernedUser = concernedUser;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String? id;
  @override
  final String? type;
  @override
  final String? background;
  @override
  final bool? concerned;
  @override
  final String? userId;
  @override
  final String? userFullname;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? description;
  final List<ConcernedUser>? _concernedUser;
  @override
  List<ConcernedUser>? get concernedUser {
    final value = _concernedUser;
    if (value == null) return null;
    if (_concernedUser is EqualUnmodifiableListView) return _concernedUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Event(id: $id, type: $type, background: $background, concerned: $concerned, userId: $userId, userFullname: $userFullname, startTime: $startTime, endTime: $endTime, description: $description, concernedUser: $concernedUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.concerned, concerned) ||
                other.concerned == concerned) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userFullname, userFullname) ||
                other.userFullname == userFullname) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._concernedUser, _concernedUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      background,
      concerned,
      userId,
      userFullname,
      startTime,
      endTime,
      description,
      const DeepCollectionEquality().hash(_concernedUser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {final String? id,
      final String? type,
      final String? background,
      final bool? concerned,
      final String? userId,
      final String? userFullname,
      final String? startTime,
      final String? endTime,
      final String? description,
      final List<ConcernedUser>? concernedUser}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String? get id;
  @override
  String? get type;
  @override
  String? get background;
  @override
  bool? get concerned;
  @override
  String? get userId;
  @override
  String? get userFullname;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get description;
  @override
  List<ConcernedUser>? get concernedUser;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
