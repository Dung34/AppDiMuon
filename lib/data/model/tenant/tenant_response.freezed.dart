// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TenantResponse _$TenantResponseFromJson(Map<String, dynamic> json) {
  return _TenantResponse.fromJson(json);
}

/// @nodoc
mixin _$TenantResponse {
  String? get tenantName => throw _privateConstructorUsedError;
  set tenantName(String? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get redirecUrl => throw _privateConstructorUsedError;
  set redirecUrl(String? value) => throw _privateConstructorUsedError;
  String? get createBy => throw _privateConstructorUsedError;
  set createBy(String? value) => throw _privateConstructorUsedError;
  String? get createDate => throw _privateConstructorUsedError;
  set createDate(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantResponseCopyWith<TenantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantResponseCopyWith<$Res> {
  factory $TenantResponseCopyWith(
          TenantResponse value, $Res Function(TenantResponse) then) =
      _$TenantResponseCopyWithImpl<$Res, TenantResponse>;
  @useResult
  $Res call(
      {String? tenantName,
      String? id,
      String? redirecUrl,
      String? createBy,
      String? createDate});
}

/// @nodoc
class _$TenantResponseCopyWithImpl<$Res, $Val extends TenantResponse>
    implements $TenantResponseCopyWith<$Res> {
  _$TenantResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantName = freezed,
    Object? id = freezed,
    Object? redirecUrl = freezed,
    Object? createBy = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_value.copyWith(
      tenantName: freezed == tenantName
          ? _value.tenantName
          : tenantName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      redirecUrl: freezed == redirecUrl
          ? _value.redirecUrl
          : redirecUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createBy: freezed == createBy
          ? _value.createBy
          : createBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TenantResponseImplCopyWith<$Res>
    implements $TenantResponseCopyWith<$Res> {
  factory _$$TenantResponseImplCopyWith(_$TenantResponseImpl value,
          $Res Function(_$TenantResponseImpl) then) =
      __$$TenantResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tenantName,
      String? id,
      String? redirecUrl,
      String? createBy,
      String? createDate});
}

/// @nodoc
class __$$TenantResponseImplCopyWithImpl<$Res>
    extends _$TenantResponseCopyWithImpl<$Res, _$TenantResponseImpl>
    implements _$$TenantResponseImplCopyWith<$Res> {
  __$$TenantResponseImplCopyWithImpl(
      _$TenantResponseImpl _value, $Res Function(_$TenantResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantName = freezed,
    Object? id = freezed,
    Object? redirecUrl = freezed,
    Object? createBy = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_$TenantResponseImpl(
      tenantName: freezed == tenantName
          ? _value.tenantName
          : tenantName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      redirecUrl: freezed == redirecUrl
          ? _value.redirecUrl
          : redirecUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createBy: freezed == createBy
          ? _value.createBy
          : createBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TenantResponseImpl implements _TenantResponse {
  _$TenantResponseImpl(
      {this.tenantName,
      this.id,
      this.redirecUrl,
      this.createBy,
      this.createDate});

  factory _$TenantResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenantResponseImplFromJson(json);

  @override
  String? tenantName;
  @override
  String? id;
  @override
  String? redirecUrl;
  @override
  String? createBy;
  @override
  String? createDate;

  @override
  String toString() {
    return 'TenantResponse(tenantName: $tenantName, id: $id, redirecUrl: $redirecUrl, createBy: $createBy, createDate: $createDate)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenantResponseImplCopyWith<_$TenantResponseImpl> get copyWith =>
      __$$TenantResponseImplCopyWithImpl<_$TenantResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenantResponseImplToJson(
      this,
    );
  }
}

abstract class _TenantResponse implements TenantResponse {
  factory _TenantResponse(
      {String? tenantName,
      String? id,
      String? redirecUrl,
      String? createBy,
      String? createDate}) = _$TenantResponseImpl;

  factory _TenantResponse.fromJson(Map<String, dynamic> json) =
      _$TenantResponseImpl.fromJson;

  @override
  String? get tenantName;
  set tenantName(String? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get redirecUrl;
  set redirecUrl(String? value);
  @override
  String? get createBy;
  set createBy(String? value);
  @override
  String? get createDate;
  set createDate(String? value);
  @override
  @JsonKey(ignore: true)
  _$$TenantResponseImplCopyWith<_$TenantResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
