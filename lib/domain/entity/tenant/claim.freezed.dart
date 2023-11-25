// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Claim _$ClaimFromJson(Map<String, dynamic> json) {
  return _Claim.fromJson(json);
}

/// @nodoc
mixin _$Claim {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  set department(String? value) => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;
  set tenantId(String? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  set createdBy(String? value) => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  set createdDate(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClaimCopyWith<Claim> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimCopyWith<$Res> {
  factory $ClaimCopyWith(Claim value, $Res Function(Claim) then) =
      _$ClaimCopyWithImpl<$Res, Claim>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? department,
      String? tenantId,
      String? id,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class _$ClaimCopyWithImpl<$Res, $Val extends Claim>
    implements $ClaimCopyWith<$Res> {
  _$ClaimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? department = freezed,
    Object? tenantId = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimImplCopyWith<$Res> implements $ClaimCopyWith<$Res> {
  factory _$$ClaimImplCopyWith(
          _$ClaimImpl value, $Res Function(_$ClaimImpl) then) =
      __$$ClaimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? department,
      String? tenantId,
      String? id,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class __$$ClaimImplCopyWithImpl<$Res>
    extends _$ClaimCopyWithImpl<$Res, _$ClaimImpl>
    implements _$$ClaimImplCopyWith<$Res> {
  __$$ClaimImplCopyWithImpl(
      _$ClaimImpl _value, $Res Function(_$ClaimImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? department = freezed,
    Object? tenantId = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$ClaimImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimImpl implements _Claim {
  _$ClaimImpl(
      {this.name,
      this.description,
      this.department,
      this.tenantId,
      this.id,
      this.createdBy,
      this.createdDate});

  factory _$ClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimImplFromJson(json);

  @override
  String? name;
  @override
  String? description;
  @override
  String? department;
  @override
  String? tenantId;
  @override
  String? id;
  @override
  String? createdBy;
  @override
  String? createdDate;

  @override
  String toString() {
    return 'Claim(name: $name, description: $description, department: $department, tenantId: $tenantId, id: $id, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      __$$ClaimImplCopyWithImpl<_$ClaimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimImplToJson(
      this,
    );
  }
}

abstract class _Claim implements Claim {
  factory _Claim(
      {String? name,
      String? description,
      String? department,
      String? tenantId,
      String? id,
      String? createdBy,
      String? createdDate}) = _$ClaimImpl;

  factory _Claim.fromJson(Map<String, dynamic> json) = _$ClaimImpl.fromJson;

  @override
  String? get name;
  set name(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get department;
  set department(String? value);
  @override
  String? get tenantId;
  set tenantId(String? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get createdBy;
  set createdBy(String? value);
  @override
  String? get createdDate;
  set createdDate(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ClaimImplCopyWith<_$ClaimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
