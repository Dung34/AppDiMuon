// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) {
  return _TaskResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskResponse {
  String? get taskName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  String? get completeDate => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  UserResponse? get assignee => throw _privateConstructorUsedError;
  UserResponse? get assigneer => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  List<TaskResponse>? get listRelatedTask => throw _privateConstructorUsedError;
  String? get createByName => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskResponseCopyWith<TaskResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskResponseCopyWith<$Res> {
  factory $TaskResponseCopyWith(
          TaskResponse value, $Res Function(TaskResponse) then) =
      _$TaskResponseCopyWithImpl<$Res, TaskResponse>;
  @useResult
  $Res call(
      {String? taskName,
      String? description,
      String? dueDate,
      String? completeDate,
      int? point,
      UserResponse? assignee,
      UserResponse? assigneer,
      int? type,
      List<TaskResponse>? listRelatedTask,
      String? createByName,
      int? status,
      int? priority,
      String? id,
      String? createdBy,
      String? createdDate});

  $UserResponseCopyWith<$Res>? get assignee;
  $UserResponseCopyWith<$Res>? get assigneer;
}

/// @nodoc
class _$TaskResponseCopyWithImpl<$Res, $Val extends TaskResponse>
    implements $TaskResponseCopyWith<$Res> {
  _$TaskResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? completeDate = freezed,
    Object? point = freezed,
    Object? assignee = freezed,
    Object? assigneer = freezed,
    Object? type = freezed,
    Object? listRelatedTask = freezed,
    Object? createByName = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      completeDate: freezed == completeDate
          ? _value.completeDate
          : completeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      assigneer: freezed == assigneer
          ? _value.assigneer
          : assigneer // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      listRelatedTask: freezed == listRelatedTask
          ? _value.listRelatedTask
          : listRelatedTask // ignore: cast_nullable_to_non_nullable
              as List<TaskResponse>?,
      createByName: freezed == createByName
          ? _value.createByName
          : createByName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
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

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get assigneer {
    if (_value.assigneer == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.assigneer!, (value) {
      return _then(_value.copyWith(assigneer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskResponseImplCopyWith<$Res>
    implements $TaskResponseCopyWith<$Res> {
  factory _$$TaskResponseImplCopyWith(
          _$TaskResponseImpl value, $Res Function(_$TaskResponseImpl) then) =
      __$$TaskResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? taskName,
      String? description,
      String? dueDate,
      String? completeDate,
      int? point,
      UserResponse? assignee,
      UserResponse? assigneer,
      int? type,
      List<TaskResponse>? listRelatedTask,
      String? createByName,
      int? status,
      int? priority,
      String? id,
      String? createdBy,
      String? createdDate});

  @override
  $UserResponseCopyWith<$Res>? get assignee;
  @override
  $UserResponseCopyWith<$Res>? get assigneer;
}

/// @nodoc
class __$$TaskResponseImplCopyWithImpl<$Res>
    extends _$TaskResponseCopyWithImpl<$Res, _$TaskResponseImpl>
    implements _$$TaskResponseImplCopyWith<$Res> {
  __$$TaskResponseImplCopyWithImpl(
      _$TaskResponseImpl _value, $Res Function(_$TaskResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? completeDate = freezed,
    Object? point = freezed,
    Object? assignee = freezed,
    Object? assigneer = freezed,
    Object? type = freezed,
    Object? listRelatedTask = freezed,
    Object? createByName = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$TaskResponseImpl(
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      completeDate: freezed == completeDate
          ? _value.completeDate
          : completeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      assigneer: freezed == assigneer
          ? _value.assigneer
          : assigneer // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      listRelatedTask: freezed == listRelatedTask
          ? _value._listRelatedTask
          : listRelatedTask // ignore: cast_nullable_to_non_nullable
              as List<TaskResponse>?,
      createByName: freezed == createByName
          ? _value.createByName
          : createByName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$TaskResponseImpl implements _TaskResponse {
  _$TaskResponseImpl(
      {this.taskName,
      this.description,
      this.dueDate,
      this.completeDate,
      this.point,
      this.assignee,
      this.assigneer,
      this.type,
      final List<TaskResponse>? listRelatedTask,
      this.createByName,
      this.status,
      this.priority,
      this.id,
      this.createdBy,
      this.createdDate})
      : _listRelatedTask = listRelatedTask;

  factory _$TaskResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskResponseImplFromJson(json);

  @override
  final String? taskName;
  @override
  final String? description;
  @override
  final String? dueDate;
  @override
  final String? completeDate;
  @override
  final int? point;
  @override
  final UserResponse? assignee;
  @override
  final UserResponse? assigneer;
  @override
  final int? type;
  final List<TaskResponse>? _listRelatedTask;
  @override
  List<TaskResponse>? get listRelatedTask {
    final value = _listRelatedTask;
    if (value == null) return null;
    if (_listRelatedTask is EqualUnmodifiableListView) return _listRelatedTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? createByName;
  @override
  final int? status;
  @override
  final int? priority;
  @override
  final String? id;
  @override
  final String? createdBy;
  @override
  final String? createdDate;

  @override
  String toString() {
    return 'TaskResponse(taskName: $taskName, description: $description, dueDate: $dueDate, completeDate: $completeDate, point: $point, assignee: $assignee, assigneer: $assigneer, type: $type, listRelatedTask: $listRelatedTask, createByName: $createByName, status: $status, priority: $priority, id: $id, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskResponseImpl &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.completeDate, completeDate) ||
                other.completeDate == completeDate) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.assigneer, assigneer) ||
                other.assigneer == assigneer) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._listRelatedTask, _listRelatedTask) &&
            (identical(other.createByName, createByName) ||
                other.createByName == createByName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
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
      description,
      dueDate,
      completeDate,
      point,
      assignee,
      assigneer,
      type,
      const DeepCollectionEquality().hash(_listRelatedTask),
      createByName,
      status,
      priority,
      id,
      createdBy,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskResponseImplCopyWith<_$TaskResponseImpl> get copyWith =>
      __$$TaskResponseImplCopyWithImpl<_$TaskResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskResponseImplToJson(
      this,
    );
  }
}

abstract class _TaskResponse implements TaskResponse {
  factory _TaskResponse(
      {final String? taskName,
      final String? description,
      final String? dueDate,
      final String? completeDate,
      final int? point,
      final UserResponse? assignee,
      final UserResponse? assigneer,
      final int? type,
      final List<TaskResponse>? listRelatedTask,
      final String? createByName,
      final int? status,
      final int? priority,
      final String? id,
      final String? createdBy,
      final String? createdDate}) = _$TaskResponseImpl;

  factory _TaskResponse.fromJson(Map<String, dynamic> json) =
      _$TaskResponseImpl.fromJson;

  @override
  String? get taskName;
  @override
  String? get description;
  @override
  String? get dueDate;
  @override
  String? get completeDate;
  @override
  int? get point;
  @override
  UserResponse? get assignee;
  @override
  UserResponse? get assigneer;
  @override
  int? get type;
  @override
  List<TaskResponse>? get listRelatedTask;
  @override
  String? get createByName;
  @override
  int? get status;
  @override
  int? get priority;
  @override
  String? get id;
  @override
  String? get createdBy;
  @override
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$TaskResponseImplCopyWith<_$TaskResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
