// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concerned_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConcernedUser _$ConcernedUserFromJson(Map<String, dynamic> json) {
  return _ConcernedUser.fromJson(json);
}

/// @nodoc
mixin _$ConcernedUser {
  String? get id => throw _privateConstructorUsedError;
  String? get fullname => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConcernedUserCopyWith<ConcernedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConcernedUserCopyWith<$Res> {
  factory $ConcernedUserCopyWith(
          ConcernedUser value, $Res Function(ConcernedUser) then) =
      _$ConcernedUserCopyWithImpl<$Res, ConcernedUser>;
  @useResult
  $Res call({String? id, String? fullname, String? avatar});
}

/// @nodoc
class _$ConcernedUserCopyWithImpl<$Res, $Val extends ConcernedUser>
    implements $ConcernedUserCopyWith<$Res> {
  _$ConcernedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConcernedUserCopyWith<$Res>
    implements $ConcernedUserCopyWith<$Res> {
  factory _$$_ConcernedUserCopyWith(
          _$_ConcernedUser value, $Res Function(_$_ConcernedUser) then) =
      __$$_ConcernedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? fullname, String? avatar});
}

/// @nodoc
class __$$_ConcernedUserCopyWithImpl<$Res>
    extends _$ConcernedUserCopyWithImpl<$Res, _$_ConcernedUser>
    implements _$$_ConcernedUserCopyWith<$Res> {
  __$$_ConcernedUserCopyWithImpl(
      _$_ConcernedUser _value, $Res Function(_$_ConcernedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_ConcernedUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConcernedUser implements _ConcernedUser {
  _$_ConcernedUser({this.id, this.fullname, this.avatar});

  factory _$_ConcernedUser.fromJson(Map<String, dynamic> json) =>
      _$$_ConcernedUserFromJson(json);

  @override
  final String? id;
  @override
  final String? fullname;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'ConcernedUser(id: $id, fullname: $fullname, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConcernedUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullname, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConcernedUserCopyWith<_$_ConcernedUser> get copyWith =>
      __$$_ConcernedUserCopyWithImpl<_$_ConcernedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConcernedUserToJson(
      this,
    );
  }
}

abstract class _ConcernedUser implements ConcernedUser {
  factory _ConcernedUser(
      {final String? id,
      final String? fullname,
      final String? avatar}) = _$_ConcernedUser;

  factory _ConcernedUser.fromJson(Map<String, dynamic> json) =
      _$_ConcernedUser.fromJson;

  @override
  String? get id;
  @override
  String? get fullname;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_ConcernedUserCopyWith<_$_ConcernedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
