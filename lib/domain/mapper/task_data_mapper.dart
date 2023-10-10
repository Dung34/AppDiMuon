import '../../data/constant/constants.dart';
import '../entity/okr/task/task.dart';

import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/okr/task/task_response/task_response.dart';
import '../entity/user/user.dart';

class TaskDataMapper extends BaseDataMapper<TaskResponse, Task>
    with DataMapperMixin {
  @override
  Task mapToEntity(TaskResponse? data) {
    return Task(
      id: data?.id,
      title: data?.taskName,
      description: data?.description,
      assignee: UserEntity(
        id: data?.assignee?.id,
        fullName: data?.assignee?.fullName,
        avatar: data?.assignee?.imageUrl,
      ),
      assigner: UserEntity(
        id: data?.assigneer?.id,
        fullName: data?.assigneer?.fullName,
        avatar: data?.assigneer?.imageUrl,
      ),
      point: data?.point,
      startDate: data?.createdDate,
      endDate: data?.dueDate,
      status: data?.status,
      statusStr: data?.status == TaskStatus.notStarted
          ? TaskStatusStr.notStarted
          : data?.status == TaskStatus.beginning
              ? TaskStatusStr.beginning
              : data?.status == TaskStatus.ended
                  ? TaskStatusStr.ended
                  : TaskStatusStr.late,
      priority: data?.priority,
      priorityStr: data?.priority == TaskPriority.low
          ? TaskPriorityStr.low
          : data?.priority == TaskPriority.medium
              ? TaskPriorityStr.medium
              : data?.priority == TaskPriority.high
                  ? TaskPriorityStr.high
                  : TaskPriorityStr.immediate,
    );
  }

  @override
  TaskResponse mapToData(Task entity) {
    return TaskResponse(
      id: entity.id,
      taskName: entity.title,
      description: entity.description,
      dueDate: entity.endDate,
      // completeDate: entity.,
      // assigneeId: entity.assignee?.id,
      // assigneerId: entity.assigner?.id,
      status: entity.status,
      priority: entity.priority,
      point: entity.point,

      // type: entity.,
    );
  }
}
