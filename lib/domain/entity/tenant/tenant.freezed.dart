// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tenant _$TenantFromJson(Map<String, dynamic> json) {
  return _Tenant.fromJson(json);
}

/// @nodoc
mixin _$Tenant {
  String? get tenantName => throw _privateConstructorUsedError;
  set tenantName(String? value) => throw _privateConstructorUsedError;
  String? get redirecUrl => throw _privateConstructorUsedError;
  set redirecUrl(String? value) => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;
  set tenantId(String? value) => throw _privateConstructorUsedError;
  String? get createBy => throw _privateConstructorUsedError;
  set createBy(String? value) => throw _privateConstructorUsedError;
  String? get createDate => throw _privateConstructorUsedError;
  set createDate(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantCopyWith<Tenant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantCopyWith<$Res> {
  factory $TenantCopyWith(Tenant value, $Res Function(Tenant) then) =
      _$TenantCopyWithImpl<$Res, Tenant>;
  @useResult
  $Res call(
      {String? tenantName,
      String? redirecUrl,
      String? tenantId,
      String? createBy,
      String? createDate});
}

/// @nodoc
class _$TenantCopyWithImpl<$Res, $Val extends Tenant>
    implements $TenantCopyWith<$Res> {
  _$TenantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantName = freezed,
    Object? redirecUrl = freezed,
    Object? tenantId = freezed,
    Object? createBy = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_value.copyWith(
      tenantName: freezed == tenantName
          ? _value.tenantName
          : tenantName // ignore: cast_nullable_to_non_nullable
              as String?,
      redirecUrl: freezed == redirecUrl
          ? _value.redirecUrl
          : redirecUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TenantImplCopyWith<$Res> implements $TenantCopyWith<$Res> {
  factory _$$TenantImplCopyWith(
          _$TenantImpl value, $Res Function(_$TenantImpl) then) =
      __$$TenantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tenantName,
      String? redirecUrl,
      String? tenantId,
      String? createBy,
      String? createDate});
}

/// @nodoc
class __$$TenantImplCopyWithImpl<$Res>
    extends _$TenantCopyWithImpl<$Res, _$TenantImpl>
    implements _$$TenantImplCopyWith<$Res> {
  __$$TenantImplCopyWithImpl(
      _$TenantImpl _value, $Res Function(_$TenantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantName = freezed,
    Object? redirecUrl = freezed,
    Object? tenantId = freezed,
    Object? createBy = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_$TenantImpl(
      tenantName: freezed == tenantName
          ? _value.tenantName
          : tenantName // ignore: cast_nullable_to_non_nullable
              as String?,
      redirecUrl: freezed == redirecUrl
          ? _value.redirecUrl
          : redirecUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
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
class _$TenantImpl implements _Tenant {
  _$TenantImpl(
      {this.tenantName,
      this.redirecUrl,
      this.tenantId,
      this.createBy,
      this.createDate});

  factory _$TenantImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenantImplFromJson(json);

  @override
  String? tenantName;
  @override
  String? redirecUrl;
  @override
  String? tenantId;
  @override
  String? createBy;
  @override
  String? createDate;

  @override
  String toString() {
    return 'Tenant(tenantName: $tenantName, redirecUrl: $redirecUrl, tenantId: $tenantId, createBy: $createBy, createDate: $createDate)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenantImplCopyWith<_$TenantImpl> get copyWith =>
      __$$TenantImplCopyWithImpl<_$TenantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenantImplToJson(
      this,
    );
  }
}

abstract class _Tenant implements Tenant {
  factory _Tenant(
      {String? tenantName,
      String? redirecUrl,
      String? tenantId,
      String? createBy,
      String? createDate}) = _$TenantImpl;

  factory _Tenant.fromJson(Map<String, dynamic> json) = _$TenantImpl.fromJson;

  @override
  String? get tenantName;
  set tenantName(String? value);
  @override
  String? get redirecUrl;
  set redirecUrl(String? value);
  @override
  String? get tenantId;
  set tenantId(String? value);
  @override
  String? get createBy;
  set createBy(String? value);
  @override
  String? get createDate;
  set createDate(String? value);
  @override
  @JsonKey(ignore: true)
  _$$TenantImplCopyWith<_$TenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
