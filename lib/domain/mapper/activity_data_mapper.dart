import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/activities/activities_response.dart';
import '../entity/okr/task/activity/activity.dart';

class ActivityMapper extends BaseDataMapper<ActivityResponse, Activity>
    with DataMapperMixin {
  @override
  ActivityResponse mapToData(Activity entity) {
    return ActivityResponse(
        fullname: entity.fullname,
        dateTimeAct: entity.dateTimeAct,
        action: entity.action);
  }

  @override
  Activity mapToEntity(ActivityResponse? data) {
    return Activity(
        fullname: data?.fullname,
        dateTimeAct: data?.dateTimeAct,
        action: data?.action);
  }
}
