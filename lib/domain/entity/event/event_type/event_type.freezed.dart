// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventType _$EventTypeFromJson(Map<String, dynamic> json) {
  return _EventType.fromJson(json);
}

/// @nodoc
mixin _$EventType {
  String? get id => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventTypeCopyWith<EventType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTypeCopyWith<$Res> {
  factory $EventTypeCopyWith(EventType value, $Res Function(EventType) then) =
      _$EventTypeCopyWithImpl<$Res, EventType>;
  @useResult
  $Res call({String? id, int? type, String? name});
}

/// @nodoc
class _$EventTypeCopyWithImpl<$Res, $Val extends EventType>
    implements $EventTypeCopyWith<$Res> {
  _$EventTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventTypeCopyWith<$Res> implements $EventTypeCopyWith<$Res> {
  factory _$$_EventTypeCopyWith(
          _$_EventType value, $Res Function(_$_EventType) then) =
      __$$_EventTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, int? type, String? name});
}

/// @nodoc
class __$$_EventTypeCopyWithImpl<$Res>
    extends _$EventTypeCopyWithImpl<$Res, _$_EventType>
    implements _$$_EventTypeCopyWith<$Res> {
  __$$_EventTypeCopyWithImpl(
      _$_EventType _value, $Res Function(_$_EventType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_EventType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventType implements _EventType {
  _$_EventType({this.id, this.type, this.name});

  factory _$_EventType.fromJson(Map<String, dynamic> json) =>
      _$$_EventTypeFromJson(json);

  @override
  final String? id;
  @override
  final int? type;
  @override
  final String? name;

  @override
  String toString() {
    return 'EventType(id: $id, type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventTypeCopyWith<_$_EventType> get copyWith =>
      __$$_EventTypeCopyWithImpl<_$_EventType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventTypeToJson(
      this,
    );
  }
}

abstract class _EventType implements EventType {
  factory _EventType({final String? id, final int? type, final String? name}) =
      _$_EventType;

  factory _EventType.fromJson(Map<String, dynamic> json) =
      _$_EventType.fromJson;

  @override
  String? get id;
  @override
  int? get type;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_EventTypeCopyWith<_$_EventType> get copyWith =>
      throw _privateConstructorUsedError;
}
