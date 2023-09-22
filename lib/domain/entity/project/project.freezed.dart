// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String? get name => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  List<ProjectMembers>? get projectMembers =>
      throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String? name,
      int? status,
      List<ProjectMembers>? projectMembers,
      List<Task>? tasks,
      String? id});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

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
              as List<ProjectMembers>?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? status,
      List<ProjectMembers>? projectMembers,
      List<Task>? tasks,
      String? id});
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$_Project>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? projectMembers = freezed,
    Object? tasks = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Project(
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
              as List<ProjectMembers>?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  _$_Project(
      {this.name,
      this.status,
      final List<ProjectMembers>? projectMembers,
      final List<Task>? tasks,
      this.id})
      : _projectMembers = projectMembers,
        _tasks = tasks;

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  final String? name;
  @override
  final int? status;
  final List<ProjectMembers>? _projectMembers;
  @override
  List<ProjectMembers>? get projectMembers {
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
  String toString() {
    return 'Project(name: $name, status: $status, projectMembers: $projectMembers, tasks: $tasks, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._projectMembers, _projectMembers) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      status,
      const DeepCollectionEquality().hash(_projectMembers),
      const DeepCollectionEquality().hash(_tasks),
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  factory _Project(
      {final String? name,
      final int? status,
      final List<ProjectMembers>? projectMembers,
      final List<Task>? tasks,
      final String? id}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String? get name;
  @override
  int? get status;
  @override
  List<ProjectMembers>? get projectMembers;
  @override
  List<Task>? get tasks;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectMembers _$ProjectMembersFromJson(Map<String, dynamic> json) {
  return _ProjectMembers.fromJson(json);
}

/// @nodoc
mixin _$ProjectMembers {
  String? get projectId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectMembersCopyWith<ProjectMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectMembersCopyWith<$Res> {
  factory $ProjectMembersCopyWith(
          ProjectMembers value, $Res Function(ProjectMembers) then) =
      _$ProjectMembersCopyWithImpl<$Res, ProjectMembers>;
  @useResult
  $Res call({String? projectId, String? userId, int? role, String? id});
}

/// @nodoc
class _$ProjectMembersCopyWithImpl<$Res, $Val extends ProjectMembers>
    implements $ProjectMembersCopyWith<$Res> {
  _$ProjectMembersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectMembersCopyWith<$Res>
    implements $ProjectMembersCopyWith<$Res> {
  factory _$$_ProjectMembersCopyWith(
          _$_ProjectMembers value, $Res Function(_$_ProjectMembers) then) =
      __$$_ProjectMembersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? projectId, String? userId, int? role, String? id});
}

/// @nodoc
class __$$_ProjectMembersCopyWithImpl<$Res>
    extends _$ProjectMembersCopyWithImpl<$Res, _$_ProjectMembers>
    implements _$$_ProjectMembersCopyWith<$Res> {
  __$$_ProjectMembersCopyWithImpl(
      _$_ProjectMembers _value, $Res Function(_$_ProjectMembers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ProjectMembers(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectMembers implements _ProjectMembers {
  _$_ProjectMembers({this.projectId, this.userId, this.role, this.id});

  factory _$_ProjectMembers.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectMembersFromJson(json);

  @override
  final String? projectId;
  @override
  final String? userId;
  @override
  final int? role;
  @override
  final String? id;

  @override
  String toString() {
    return 'ProjectMembers(projectId: $projectId, userId: $userId, role: $role, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectMembers &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, userId, role, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectMembersCopyWith<_$_ProjectMembers> get copyWith =>
      __$$_ProjectMembersCopyWithImpl<_$_ProjectMembers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectMembersToJson(
      this,
    );
  }
}

abstract class _ProjectMembers implements ProjectMembers {
  factory _ProjectMembers(
      {final String? projectId,
      final String? userId,
      final int? role,
      final String? id}) = _$_ProjectMembers;

  factory _ProjectMembers.fromJson(Map<String, dynamic> json) =
      _$_ProjectMembers.fromJson;

  @override
  String? get projectId;
  @override
  String? get userId;
  @override
  int? get role;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectMembersCopyWith<_$_ProjectMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
