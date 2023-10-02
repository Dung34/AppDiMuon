// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return _Unit.fromJson(json);
}

/// @nodoc
mixin _$Unit {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get parrentId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  int? get totalMemberCount => throw _privateConstructorUsedError;
  List<Unit>? get subUnit => throw _privateConstructorUsedError;
  String? get okRsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitCopyWith<Unit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitCopyWith<$Res> {
  factory $UnitCopyWith(Unit value, $Res Function(Unit) then) =
      _$UnitCopyWithImpl<$Res, Unit>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? parrentId,
      String? description,
      String? coverImage,
      int? totalMemberCount,
      List<Unit>? subUnit,
      String? okRsId});
}

/// @nodoc
class _$UnitCopyWithImpl<$Res, $Val extends Unit>
    implements $UnitCopyWith<$Res> {
  _$UnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parrentId = freezed,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? totalMemberCount = freezed,
    Object? subUnit = freezed,
    Object? okRsId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parrentId: freezed == parrentId
          ? _value.parrentId
          : parrentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMemberCount: freezed == totalMemberCount
          ? _value.totalMemberCount
          : totalMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      subUnit: freezed == subUnit
          ? _value.subUnit
          : subUnit // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
      okRsId: freezed == okRsId
          ? _value.okRsId
          : okRsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitCopyWith<$Res> implements $UnitCopyWith<$Res> {
  factory _$$_UnitCopyWith(_$_Unit value, $Res Function(_$_Unit) then) =
      __$$_UnitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? parrentId,
      String? description,
      String? coverImage,
      int? totalMemberCount,
      List<Unit>? subUnit,
      String? okRsId});
}

/// @nodoc
class __$$_UnitCopyWithImpl<$Res> extends _$UnitCopyWithImpl<$Res, _$_Unit>
    implements _$$_UnitCopyWith<$Res> {
  __$$_UnitCopyWithImpl(_$_Unit _value, $Res Function(_$_Unit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? parrentId = freezed,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? totalMemberCount = freezed,
    Object? subUnit = freezed,
    Object? okRsId = freezed,
  }) {
    return _then(_$_Unit(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parrentId: freezed == parrentId
          ? _value.parrentId
          : parrentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMemberCount: freezed == totalMemberCount
          ? _value.totalMemberCount
          : totalMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      subUnit: freezed == subUnit
          ? _value._subUnit
          : subUnit // ignore: cast_nullable_to_non_nullable
              as List<Unit>?,
      okRsId: freezed == okRsId
          ? _value.okRsId
          : okRsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Unit implements _Unit {
  _$_Unit(
      {this.id,
      this.name,
      this.parrentId,
      this.description,
      this.coverImage,
      this.totalMemberCount,
      final List<Unit>? subUnit,
      this.okRsId})
      : _subUnit = subUnit;

  factory _$_Unit.fromJson(Map<String, dynamic> json) => _$$_UnitFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? parrentId;
  @override
  final String? description;
  @override
  final String? coverImage;
  @override
  final int? totalMemberCount;
  final List<Unit>? _subUnit;
  @override
  List<Unit>? get subUnit {
    final value = _subUnit;
    if (value == null) return null;
    if (_subUnit is EqualUnmodifiableListView) return _subUnit;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? okRsId;

  @override
  String toString() {
    return 'Unit(id: $id, name: $name, parrentId: $parrentId, description: $description, coverImage: $coverImage, totalMemberCount: $totalMemberCount, subUnit: $subUnit, okRsId: $okRsId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parrentId, parrentId) ||
                other.parrentId == parrentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.totalMemberCount, totalMemberCount) ||
                other.totalMemberCount == totalMemberCount) &&
            const DeepCollectionEquality().equals(other._subUnit, _subUnit) &&
            (identical(other.okRsId, okRsId) || other.okRsId == okRsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      parrentId,
      description,
      coverImage,
      totalMemberCount,
      const DeepCollectionEquality().hash(_subUnit),
      okRsId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitCopyWith<_$_Unit> get copyWith =>
      __$$_UnitCopyWithImpl<_$_Unit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitToJson(
      this,
    );
  }
}

abstract class _Unit implements Unit {
  factory _Unit(
      {final String? id,
      final String? name,
      final String? parrentId,
      final String? description,
      final String? coverImage,
      final int? totalMemberCount,
      final List<Unit>? subUnit,
      final String? okRsId}) = _$_Unit;

  factory _Unit.fromJson(Map<String, dynamic> json) = _$_Unit.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get parrentId;
  @override
  String? get description;
  @override
  String? get coverImage;
  @override
  int? get totalMemberCount;
  @override
  List<Unit>? get subUnit;
  @override
  String? get okRsId;
  @override
  @JsonKey(ignore: true)
  _$$_UnitCopyWith<_$_Unit> get copyWith => throw _privateConstructorUsedError;
}
