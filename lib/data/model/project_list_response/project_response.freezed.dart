// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) {
  return _ProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectResponse {
  String? get name => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  List<ProjectMember>? get projectMembers => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get createDate => throw _privateConstructorUsedError;
  String? get createBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectResponseCopyWith<ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectResponseCopyWith<$Res> {
  factory $ProjectResponseCopyWith(
          ProjectResponse value, $Res Function(ProjectResponse) then) =
      _$ProjectResponseCopyWithImpl<$Res, ProjectResponse>;
  @useResult
  $Res call(
      {String? name,
      int? status,
      List<ProjectMember>? projectMembers,
      List<Task>? tasks,
      String? id,
      String? createDate,
      String? createBy});
}

/// @nodoc
class _$ProjectResponseCopyWithImpl<$Res, $Val extends ProjectResponse>
    implements $ProjectResponseCopyWith<$Res> {
  _$ProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? projectMembers = freezed,
    Object? tasks = freezed,
    Object? id = freezed,
    Object? createDate = freezed,
    Object? createBy = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      projectMembers: freezed == projectMembers
          ? _value.projectMembers
          : projectMembers // ignore: cast_nullable_to_non_nullable
              as List<ProjectMember>?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createBy: freezed == createBy
          ? _value.createBy
          : createBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectResponseCopyWith<$Res>
    implements $ProjectResponseCopyWith<$Res> {
  factory _$$_ProjectResponseCopyWith(
          _$_ProjectResponse value, $Res Function(_$_ProjectResponse) then) =
      __$$_ProjectResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? status,
      List<ProjectMember>? projectMembers,
      List<Task>? tasks,
      String? id,
      String? createDate,
      String? createBy});
}

/// @nodoc
class __$$_ProjectResponseCopyWithImpl<$Res>
    extends _$ProjectResponseCopyWithImpl<$Res, _$_ProjectResponse>
    implements _$$_ProjectResponseCopyWith<$Res> {
  __$$_ProjectResponseCopyWithImpl(
      _$_ProjectResponse _value, $Res Function(_$_ProjectResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? projectMembers = freezed,
    Object? tasks = freezed,
    Object? id = freezed,
    Object? createDate = freezed,
    Object? createBy = freezed,
  }) {
    return _then(_$_ProjectResponse(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      projectMembers: freezed == projectMembers
          ? _value._projectMembers
          : projectMembers // ignore: cast_nullable_to_non_nullable
              as List<ProjectMember>?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createBy: freezed == createBy
          ? _value.createBy
          : createBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectResponse implements _ProjectResponse {
  _$_ProjectResponse(
      {this.name,
      this.status,
      final List<ProjectMember>? projectMembers,
      final List<Task>? tasks,
      this.id,
      this.createDate,
      this.createBy})
      : _projectMembers = projectMembers,
        _tasks = tasks;

  factory _$_ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectResponseFromJson(json);

  @override
  final String? name;
  @override
  final int? status;
  final List<ProjectMember>? _projectMembers;
  @override
  List<ProjectMember>? get projectMembers {
    final value = _projectMembers;
    if (value == null) return null;
    if (_projectMembers is EqualUnmodifiableListView) return _projectMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Task>? _tasks;
  @override
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;
  @override
  final String? createDate;
  @override
  final String? createBy;

  @override
  String toString() {
    return 'ProjectResponse(name: $name, status: $status, projectMembers: $projectMembers, tasks: $tasks, id: $id, createDate: $createDate, createBy: $createBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._projectMembers, _projectMembers) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.createBy, createBy) ||
                other.createBy == createBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      status,
      const DeepCollectionEquality().hash(_projectMembers),
      const DeepCollectionEquality().hash(_tasks),
      id,
      createDate,
      createBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectResponseCopyWith<_$_ProjectResponse> get copyWith =>
      __$$_ProjectResponseCopyWithImpl<_$_ProjectResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectResponseToJson(
      this,
    );
  }
}

abstract class _ProjectResponse implements ProjectResponse {
  factory _ProjectResponse(
      {final String? name,
      final int? status,
      final List<ProjectMember>? projectMembers,
      final List<Task>? tasks,
      final String? id,
      final String? createDate,
      final String? createBy}) = _$_ProjectResponse;

  factory _ProjectResponse.fromJson(Map<String, dynamic> json) =
      _$_ProjectResponse.fromJson;

  @override
  String? get name;
  @override
  int? get status;
  @override
  List<ProjectMember>? get projectMembers;
  @override
  List<Task>? get tasks;
  @override
  String? get id;
  @override
  String? get createDate;
  @override
  String? get createBy;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectResponseCopyWith<_$_ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
