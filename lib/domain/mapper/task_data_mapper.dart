import '../../data/constant/constants.dart';
import '../entity/okr/task/task.dart';

import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/okr/task/task_response/task_response.dart';

class TaskDataMapper extends BaseDataMapper<TaskResponse, Task> {
  @override
  Task mapToEntity(TaskResponse? data) {
    return Task(
      id: data?.id,
      title: data?.taskName,
      description: data?.description,
      assignee: data?.assigneeId,
      assigner: data?.assigneerId,
      point: data?.point,
      startDate: data?.createdDate,
      endDate: data?.dueDate,
      status: data?.status,
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
}
