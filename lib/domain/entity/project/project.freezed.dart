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
  List<ProjectMember>? get projectMembers => throw _privateConstructorUsedError;
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
      List<ProjectMember>? projectMembers,
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
              as List<ProjectMember>?,
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
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? status,
      List<ProjectMember>? projectMembers,
      List<Task>? tasks,
      String? id});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
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
    return _then(_$ProjectImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  _$ProjectImpl(
      {this.name,
      this.status,
      final List<ProjectMember>? projectMembers,
      final List<Task>? tasks,
      this.id})
      : _projectMembers = projectMembers,
        _tasks = tasks;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

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
  String toString() {
    return 'Project(name: $name, status: $status, projectMembers: $projectMembers, tasks: $tasks, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
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
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  factory _Project(
      {final String? name,
      final int? status,
      final List<ProjectMember>? projectMembers,
      final List<Task>? tasks,
      final String? id}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectMember _$ProjectMemberFromJson(Map<String, dynamic> json) {
  return _ProjectMember.fromJson(json);
}

/// @nodoc
mixin _$ProjectMember {
  String? get userId => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectMemberCopyWith<ProjectMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectMemberCopyWith<$Res> {
  factory $ProjectMemberCopyWith(
          ProjectMember value, $Res Function(ProjectMember) then) =
      _$ProjectMemberCopyWithImpl<$Res, ProjectMember>;
  @useResult
  $Res call({String? userId, int? role});
}

/// @nodoc
class _$ProjectMemberCopyWithImpl<$Res, $Val extends ProjectMember>
    implements $ProjectMemberCopyWith<$Res> {
  _$ProjectMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectMemberImplCopyWith<$Res>
    implements $ProjectMemberCopyWith<$Res> {
  factory _$$ProjectMemberImplCopyWith(
          _$ProjectMemberImpl value, $Res Function(_$ProjectMemberImpl) then) =
      __$$ProjectMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, int? role});
}

/// @nodoc
class __$$ProjectMemberImplCopyWithImpl<$Res>
    extends _$ProjectMemberCopyWithImpl<$Res, _$ProjectMemberImpl>
    implements _$$ProjectMemberImplCopyWith<$Res> {
  __$$ProjectMemberImplCopyWithImpl(
      _$ProjectMemberImpl _value, $Res Function(_$ProjectMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? role = freezed,
  }) {
    return _then(_$ProjectMemberImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectMemberImpl implements _ProjectMember {
  _$ProjectMemberImpl({this.userId, this.role});

  factory _$ProjectMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectMemberImplFromJson(json);

  @override
  final String? userId;
  @override
  final int? role;

  @override
  String toString() {
    return 'ProjectMember(userId: $userId, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectMemberImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectMemberImplCopyWith<_$ProjectMemberImpl> get copyWith =>
      __$$ProjectMemberImplCopyWithImpl<_$ProjectMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectMemberImplToJson(
      this,
    );
  }
}

abstract class _ProjectMember implements ProjectMember {
  factory _ProjectMember({final String? userId, final int? role}) =
      _$ProjectMemberImpl;

  factory _ProjectMember.fromJson(Map<String, dynamic> json) =
      _$ProjectMemberImpl.fromJson;

  @override
  String? get userId;
  @override
  int? get role;
  @override
  @JsonKey(ignore: true)
  _$$ProjectMemberImplCopyWith<_$ProjectMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
