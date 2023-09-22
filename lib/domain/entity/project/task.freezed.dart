// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String? get taskName => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  String? get completeDate => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  List<TaskMembers>? get taskMembers => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String? taskName,
      String? dueDate,
      String? completeDate,
      String? projectId,
      List<TaskMembers>? taskMembers,
      String? id,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = freezed,
    Object? dueDate = freezed,
    Object? completeDate = freezed,
    Object? projectId = freezed,
    Object? taskMembers = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      completeDate: freezed == completeDate
          ? _value.completeDate
          : completeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskMembers: freezed == taskMembers
          ? _value.taskMembers
          : taskMembers // ignore: cast_nullable_to_non_nullable
              as List<TaskMembers>?,
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
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? taskName,
      String? dueDate,
      String? completeDate,
      String? projectId,
      List<TaskMembers>? taskMembers,
      String? id,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = freezed,
    Object? dueDate = freezed,
    Object? completeDate = freezed,
    Object? projectId = freezed,
    Object? taskMembers = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_Task(
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      completeDate: freezed == completeDate
          ? _value.completeDate
          : completeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskMembers: freezed == taskMembers
          ? _value._taskMembers
          : taskMembers // ignore: cast_nullable_to_non_nullable
              as List<TaskMembers>?,
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
class _$_Task implements _Task {
  _$_Task(
      {this.taskName,
      this.dueDate,
      this.completeDate,
      this.projectId,
      final List<TaskMembers>? taskMembers,
      this.id,
      this.createdBy,
      this.createdDate})
      : _taskMembers = taskMembers;

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String? taskName;
  @override
  final String? dueDate;
  @override
  final String? completeDate;
  @override
  final String? projectId;
  final List<TaskMembers>? _taskMembers;
  @override
  List<TaskMembers>? get taskMembers {
    final value = _taskMembers;
    if (value == null) return null;
    if (_taskMembers is EqualUnmodifiableListView) return _taskMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;
  @override
  final String? createdBy;
  @override
  final String? createdDate;

  @override
  String toString() {
    return 'Task(taskName: $taskName, dueDate: $dueDate, completeDate: $completeDate, projectId: $projectId, taskMembers: $taskMembers, id: $id, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.completeDate, completeDate) ||
                other.completeDate == completeDate) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._taskMembers, _taskMembers) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskName,
      dueDate,
      completeDate,
      projectId,
      const DeepCollectionEquality().hash(_taskMembers),
      id,
      createdBy,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  factory _Task(
      {final String? taskName,
      final String? dueDate,
      final String? completeDate,
      final String? projectId,
      final List<TaskMembers>? taskMembers,
      final String? id,
      final String? createdBy,
      final String? createdDate}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String? get taskName;
  @override
  String? get dueDate;
  @override
  String? get completeDate;
  @override
  String? get projectId;
  @override
  List<TaskMembers>? get taskMembers;
  @override
  String? get id;
  @override
  String? get createdBy;
  @override
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}

TaskMembers _$TaskMembersFromJson(Map<String, dynamic> json) {
  return _TaskMembers.fromJson(json);
}

/// @nodoc
mixin _$TaskMembers {
  String? get taskId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskMembersCopyWith<TaskMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskMembersCopyWith<$Res> {
  factory $TaskMembersCopyWith(
          TaskMembers value, $Res Function(TaskMembers) then) =
      _$TaskMembersCopyWithImpl<$Res, TaskMembers>;
  @useResult
  $Res call({String? taskId, String? userId, int? role, String? id});
}

/// @nodoc
class _$TaskMembersCopyWithImpl<$Res, $Val extends TaskMembers>
    implements $TaskMembersCopyWith<$Res> {
  _$TaskMembersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TaskMembersCopyWith<$Res>
    implements $TaskMembersCopyWith<$Res> {
  factory _$$_TaskMembersCopyWith(
          _$_TaskMembers value, $Res Function(_$_TaskMembers) then) =
      __$$_TaskMembersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? taskId, String? userId, int? role, String? id});
}

/// @nodoc
class __$$_TaskMembersCopyWithImpl<$Res>
    extends _$TaskMembersCopyWithImpl<$Res, _$_TaskMembers>
    implements _$$_TaskMembersCopyWith<$Res> {
  __$$_TaskMembersCopyWithImpl(
      _$_TaskMembers _value, $Res Function(_$_TaskMembers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_TaskMembers(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
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
class _$_TaskMembers implements _TaskMembers {
  _$_TaskMembers({this.taskId, this.userId, this.role, this.id});

  factory _$_TaskMembers.fromJson(Map<String, dynamic> json) =>
      _$$_TaskMembersFromJson(json);

  @override
  final String? taskId;
  @override
  final String? userId;
  @override
  final int? role;
  @override
  final String? id;

  @override
  String toString() {
    return 'TaskMembers(taskId: $taskId, userId: $userId, role: $role, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskMembers &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, userId, role, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskMembersCopyWith<_$_TaskMembers> get copyWith =>
      __$$_TaskMembersCopyWithImpl<_$_TaskMembers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskMembersToJson(
      this,
    );
  }
}

abstract class _TaskMembers implements TaskMembers {
  factory _TaskMembers(
      {final String? taskId,
      final String? userId,
      final int? role,
      final String? id}) = _$_TaskMembers;

  factory _TaskMembers.fromJson(Map<String, dynamic> json) =
      _$_TaskMembers.fromJson;

  @override
  String? get taskId;
  @override
  String? get userId;
  @override
  int? get role;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_TaskMembersCopyWith<_$_TaskMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
