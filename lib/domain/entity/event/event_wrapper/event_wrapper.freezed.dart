// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventWrapper _$EventWrapperFromJson(Map<String, dynamic> json) {
  return _EventWrapper.fromJson(json);
}

/// @nodoc
mixin _$EventWrapper {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<Event>? get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventWrapperCopyWith<EventWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventWrapperCopyWith<$Res> {
  factory $EventWrapperCopyWith(
          EventWrapper value, $Res Function(EventWrapper) then) =
      _$EventWrapperCopyWithImpl<$Res, EventWrapper>;
  @useResult
  $Res call({String? id, String? title, List<Event>? events});
}

/// @nodoc
class _$EventWrapperCopyWithImpl<$Res, $Val extends EventWrapper>
    implements $EventWrapperCopyWith<$Res> {
  _$EventWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? events = freezed,
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
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventWrapperCopyWith<$Res>
    implements $EventWrapperCopyWith<$Res> {
  factory _$$_EventWrapperCopyWith(
          _$_EventWrapper value, $Res Function(_$_EventWrapper) then) =
      __$$_EventWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, List<Event>? events});
}

/// @nodoc
class __$$_EventWrapperCopyWithImpl<$Res>
    extends _$EventWrapperCopyWithImpl<$Res, _$_EventWrapper>
    implements _$$_EventWrapperCopyWith<$Res> {
  __$$_EventWrapperCopyWithImpl(
      _$_EventWrapper _value, $Res Function(_$_EventWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? events = freezed,
  }) {
    return _then(_$_EventWrapper(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventWrapper implements _EventWrapper {
  _$_EventWrapper({this.id, this.title, final List<Event>? events = const []})
      : _events = events;

  factory _$_EventWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_EventWrapperFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  final List<Event>? _events;
  @override
  @JsonKey()
  List<Event>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventWrapper(id: $id, title: $title, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventWrapper &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventWrapperCopyWith<_$_EventWrapper> get copyWith =>
      __$$_EventWrapperCopyWithImpl<_$_EventWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventWrapperToJson(
      this,
    );
  }
}

abstract class _EventWrapper implements EventWrapper {
  factory _EventWrapper(
      {final String? id,
      final String? title,
      final List<Event>? events}) = _$_EventWrapper;

  factory _EventWrapper.fromJson(Map<String, dynamic> json) =
      _$_EventWrapper.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  List<Event>? get events;
  @override
  @JsonKey(ignore: true)
  _$$_EventWrapperCopyWith<_$_EventWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}
