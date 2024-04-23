import 'package:hive/hive.dart';

part 'scheduleData.g.dart';

@HiveType(typeId: 0)
class ScheduleData extends HiveObject {
  @HiveField(0)
  String communityId;

  @HiveField(1)
  String schedule_id;

  ScheduleData({required this.communityId, required this.schedule_id});

  Map<dynamic, String> toJson() {
    return {
      'communityId': communityId,
      'schedule_id': schedule_id,
    };
  }
}