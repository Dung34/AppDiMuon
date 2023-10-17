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
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  UserEntity? get assignee => throw _privateConstructorUsedError;
  set assignee(UserEntity? value) => throw _privateConstructorUsedError;
  UserEntity? get assigner => throw _privateConstructorUsedError;
  set assigner(UserEntity? value) => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  set point(int? value) => throw _privateConstructorUsedError;
  Task? get parrentTask => throw _privateConstructorUsedError;
  set parrentTask(Task? value) => throw _privateConstructorUsedError;
  List<Task>? get relatedTask => throw _privateConstructorUsedError;
  set relatedTask(List<Task>? value) => throw _privateConstructorUsedError;
  String? get keyResultId => throw _privateConstructorUsedError;
  set keyResultId(String? value) => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  set startDate(String? value) => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  set endDate(String? value) => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  set status(int? value) => throw _privateConstructorUsedError;
  String? get statusStr => throw _privateConstructorUsedError;
  set statusStr(String? value) => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  set priority(int? value) => throw _privateConstructorUsedError;
  String? get priorityStr => throw _privateConstructorUsedError;
  set priorityStr(String? value) => throw _privateConstructorUsedError;

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
      {String? id,
      String? title,
      String? description,
      UserEntity? assignee,
      UserEntity? assigner,
      int? point,
      Task? parrentTask,
      List<Task>? relatedTask,
      String? keyResultId,
      String? startDate,
      String? endDate,
      int? status,
      String? statusStr,
      int? priority,
      String? priorityStr});

  $UserEntityCopyWith<$Res>? get assignee;
  $UserEntityCopyWith<$Res>? get assigner;
  $TaskCopyWith<$Res>? get parrentTask;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? assignee = freezed,
    Object? assigner = freezed,
    Object? point = freezed,
    Object? parrentTask = freezed,
    Object? relatedTask = freezed,
    Object? keyResultId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? statusStr = freezed,
    Object? priority = freezed,
    Object? priorityStr = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      parrentTask: freezed == parrentTask
          ? _value.parrentTask
          : parrentTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      relatedTask: freezed == relatedTask
          ? _value.relatedTask
          : relatedTask // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      keyResultId: freezed == keyResultId
          ? _value.keyResultId
          : keyResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusStr: freezed == statusStr
          ? _value.statusStr
          : statusStr // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      priorityStr: freezed == priorityStr
          ? _value.priorityStr
          : priorityStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res>? get parrentTask {
    if (_value.parrentTask == null) {
      return null;
    }

    return $TaskCopyWith<$Res>(_value.parrentTask!, (value) {
      return _then(_value.copyWith(parrentTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      UserEntity? assignee,
      UserEntity? assigner,
      int? point,
      Task? parrentTask,
      List<Task>? relatedTask,
      String? keyResultId,
      String? startDate,
      String? endDate,
      int? status,
      String? statusStr,
      int? priority,
      String? priorityStr});

  @override
  $UserEntityCopyWith<$Res>? get assignee;
  @override
  $UserEntityCopyWith<$Res>? get assigner;
  @override
  $TaskCopyWith<$Res>? get parrentTask;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? assignee = freezed,
    Object? assigner = freezed,
    Object? point = freezed,
    Object? parrentTask = freezed,
    Object? relatedTask = freezed,
    Object? keyResultId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? statusStr = freezed,
    Object? priority = freezed,
    Object? priorityStr = freezed,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      parrentTask: freezed == parrentTask
          ? _value.parrentTask
          : parrentTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      relatedTask: freezed == relatedTask
          ? _value.relatedTask
          : relatedTask // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      keyResultId: freezed == keyResultId
          ? _value.keyResultId
          : keyResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusStr: freezed == statusStr
          ? _value.statusStr
          : statusStr // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      priorityStr: freezed == priorityStr
          ? _value.priorityStr
          : priorityStr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  _$TaskImpl(
      {this.id,
      this.title,
      this.description,
      this.assignee,
      this.assigner,
      this.point,
      this.parrentTask,
      this.relatedTask,
      this.keyResultId,
      this.startDate,
      this.endDate,
      this.status,
      this.statusStr,
      this.priority,
      this.priorityStr});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  String? id;
  @override
  String? title;
  @override
  String? description;
  @override
  UserEntity? assignee;
  @override
  UserEntity? assigner;
  @override
  int? point;
  @override
  Task? parrentTask;
  @override
  List<Task>? relatedTask;
  @override
  String? keyResultId;
  @override
  String? startDate;
  @override
  String? endDate;
  @override
  int? status;
  @override
  String? statusStr;
  @override
  int? priority;
  @override
  String? priorityStr;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, assignee: $assignee, assigner: $assigner, point: $point, parrentTask: $parrentTask, relatedTask: $relatedTask, keyResultId: $keyResultId, startDate: $startDate, endDate: $endDate, status: $status, statusStr: $statusStr, priority: $priority, priorityStr: $priorityStr)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  factory _Task(
      {String? id,
      String? title,
      String? description,
      UserEntity? assignee,
      UserEntity? assigner,
      int? point,
      Task? parrentTask,
      List<Task>? relatedTask,
      String? keyResultId,
      String? startDate,
      String? endDate,
      int? status,
      String? statusStr,
      int? priority,
      String? priorityStr}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get title;
  set title(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  UserEntity? get assignee;
  set assignee(UserEntity? value);
  @override
  UserEntity? get assigner;
  set assigner(UserEntity? value);
  @override
  int? get point;
  set point(int? value);
  @override
  Task? get parrentTask;
  set parrentTask(Task? value);
  @override
  List<Task>? get relatedTask;
  set relatedTask(List<Task>? value);
  @override
  String? get keyResultId;
  set keyResultId(String? value);
  @override
  String? get startDate;
  set startDate(String? value);
  @override
  String? get endDate;
  set endDate(String? value);
  @override
  int? get status;
  set status(int? value);
  @override
  String? get statusStr;
  set statusStr(String? value);
  @override
  int? get priority;
  set priority(int? value);
  @override
  String? get priorityStr;
  set priorityStr(String? value);
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
