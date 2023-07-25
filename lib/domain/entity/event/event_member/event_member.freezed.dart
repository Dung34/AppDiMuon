// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventMember _$EventMemberFromJson(Map<String, dynamic> json) {
  return _EventMember.fromJson(json);
}

/// @nodoc
mixin _$EventMember {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get eventTitle => throw _privateConstructorUsedError;
  String? get checkedInLocation => throw _privateConstructorUsedError;
  String? get checkedInDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventMemberCopyWith<EventMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventMemberCopyWith<$Res> {
  factory $EventMemberCopyWith(
          EventMember value, $Res Function(EventMember) then) =
      _$EventMemberCopyWithImpl<$Res, EventMember>;
  @useResult
  $Res call(
      {String? id,
      String userId,
      String? eventId,
      String? fullname,
      String? avatar,
      String? eventTitle,
      String? checkedInLocation,
      String? checkedInDate});
}

/// @nodoc
class _$EventMemberCopyWithImpl<$Res, $Val extends EventMember>
    implements $EventMemberCopyWith<$Res> {
  _$EventMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? eventId = freezed,
    Object? fullname = freezed,
    Object? avatar = freezed,
    Object? eventTitle = freezed,
    Object? checkedInLocation = freezed,
    Object? checkedInDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInLocation: freezed == checkedInLocation
          ? _value.checkedInLocation
          : checkedInLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInDate: freezed == checkedInDate
          ? _value.checkedInDate
          : checkedInDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventMemberCopyWith<$Res>
    implements $EventMemberCopyWith<$Res> {
  factory _$$_EventMemberCopyWith(
          _$_EventMember value, $Res Function(_$_EventMember) then) =
      __$$_EventMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      String? eventId,
      String? fullname,
      String? avatar,
      String? eventTitle,
      String? checkedInLocation,
      String? checkedInDate});
}

/// @nodoc
class __$$_EventMemberCopyWithImpl<$Res>
    extends _$EventMemberCopyWithImpl<$Res, _$_EventMember>
    implements _$$_EventMemberCopyWith<$Res> {
  __$$_EventMemberCopyWithImpl(
      _$_EventMember _value, $Res Function(_$_EventMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? eventId = freezed,
    Object? fullname = freezed,
    Object? avatar = freezed,
    Object? eventTitle = freezed,
    Object? checkedInLocation = freezed,
    Object? checkedInDate = freezed,
  }) {
    return _then(_$_EventMember(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInLocation: freezed == checkedInLocation
          ? _value.checkedInLocation
          : checkedInLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInDate: freezed == checkedInDate
          ? _value.checkedInDate
          : checkedInDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventMember implements _EventMember {
  _$_EventMember(
      {this.id,
      this.userId = '',
      this.eventId,
      this.fullname,
      this.avatar,
      this.eventTitle,
      this.checkedInLocation,
      this.checkedInDate});

  factory _$_EventMember.fromJson(Map<String, dynamic> json) =>
      _$$_EventMemberFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String userId;
  @override
  final String? eventId;
  @override
  final String? fullname;
  @override
  final String? avatar;
  @override
  final String? eventTitle;
  @override
  final String? checkedInLocation;
  @override
  final String? checkedInDate;

  @override
  String toString() {
    return 'EventMember(id: $id, userId: $userId, eventId: $eventId, fullname: $fullname, avatar: $avatar, eventTitle: $eventTitle, checkedInLocation: $checkedInLocation, checkedInDate: $checkedInDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventMember &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.checkedInLocation, checkedInLocation) ||
                other.checkedInLocation == checkedInLocation) &&
            (identical(other.checkedInDate, checkedInDate) ||
                other.checkedInDate == checkedInDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, eventId, fullname,
      avatar, eventTitle, checkedInLocation, checkedInDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventMemberCopyWith<_$_EventMember> get copyWith =>
      __$$_EventMemberCopyWithImpl<_$_EventMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventMemberToJson(
      this,
    );
  }
}

abstract class _EventMember implements EventMember {
  factory _EventMember(
      {final String? id,
      final String userId,
      final String? eventId,
      final String? fullname,
      final String? avatar,
      final String? eventTitle,
      final String? checkedInLocation,
      final String? checkedInDate}) = _$_EventMember;

  factory _EventMember.fromJson(Map<String, dynamic> json) =
      _$_EventMember.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String? get eventId;
  @override
  String? get fullname;
  @override
  String? get avatar;
  @override
  String? get eventTitle;
  @override
  String? get checkedInLocation;
  @override
  String? get checkedInDate;
  @override
  @JsonKey(ignore: true)
  _$$_EventMemberCopyWith<_$_EventMember> get copyWith =>
      throw _privateConstructorUsedError;
}
