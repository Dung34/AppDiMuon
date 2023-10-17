// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_target_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListTargetResponse _$ListTargetResponseFromJson(Map<String, dynamic> json) {
  return _ListTargetResponse.fromJson(json);
}

/// @nodoc
mixin _$ListTargetResponse {
  List<Target>? get data => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListTargetResponseCopyWith<ListTargetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTargetResponseCopyWith<$Res> {
  factory $ListTargetResponseCopyWith(
          ListTargetResponse value, $Res Function(ListTargetResponse) then) =
      _$ListTargetResponseCopyWithImpl<$Res, ListTargetResponse>;
  @useResult
  $Res call({List<Target>? data, int? totalCount});
}

/// @nodoc
class _$ListTargetResponseCopyWithImpl<$Res, $Val extends ListTargetResponse>
    implements $ListTargetResponseCopyWith<$Res> {
  _$ListTargetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Target>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListTargetResponseImplCopyWith<$Res>
    implements $ListTargetResponseCopyWith<$Res> {
  factory _$$ListTargetResponseImplCopyWith(_$ListTargetResponseImpl value,
          $Res Function(_$ListTargetResponseImpl) then) =
      __$$ListTargetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Target>? data, int? totalCount});
}

/// @nodoc
class __$$ListTargetResponseImplCopyWithImpl<$Res>
    extends _$ListTargetResponseCopyWithImpl<$Res, _$ListTargetResponseImpl>
    implements _$$ListTargetResponseImplCopyWith<$Res> {
  __$$ListTargetResponseImplCopyWithImpl(_$ListTargetResponseImpl _value,
      $Res Function(_$ListTargetResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$ListTargetResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Target>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListTargetResponseImpl implements _ListTargetResponse {
  _$ListTargetResponseImpl({final List<Target>? data, this.totalCount})
      : _data = data;

  factory _$ListTargetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListTargetResponseImplFromJson(json);

  final List<Target>? _data;
  @override
  List<Target>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'ListTargetResponse(data: $data, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTargetResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTargetResponseImplCopyWith<_$ListTargetResponseImpl> get copyWith =>
      __$$ListTargetResponseImplCopyWithImpl<_$ListTargetResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListTargetResponseImplToJson(
      this,
    );
  }
}

abstract class _ListTargetResponse implements ListTargetResponse {
  factory _ListTargetResponse(
      {final List<Target>? data,
      final int? totalCount}) = _$ListTargetResponseImpl;

  factory _ListTargetResponse.fromJson(Map<String, dynamic> json) =
      _$ListTargetResponseImpl.fromJson;

  @override
  List<Target>? get data;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$ListTargetResponseImplCopyWith<_$ListTargetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
