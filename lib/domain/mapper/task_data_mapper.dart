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
        id: data?.assigneeId,
        firstName: 'Thanh Pham',
        imageUrl:
            'https://i.pinimg.com/736x/c0/ca/7c/c0ca7c23d37ece20730b2895d625da31.jpg',
      ),
      assigner: UserEntity(
        id: data?.assigneerId,
        firstName: 'Lã Thanh Hương',
        imageUrl:
            'https://ih1.redbubble.net/image.1357487604.8176/st,small,507x507-pad,600x600,f8f8f8.jpg',
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
    return TaskResponse();
  }
}
