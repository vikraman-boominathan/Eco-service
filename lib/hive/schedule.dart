import 'package:hive/hive.dart';

import 'community.dart';
part 'schedule.g.dart';

@HiveType(typeId: 2)
class Schedule {
  @HiveField(0)
  final List<Community> communities;

  @HiveField(1)
  final String scheduleId;


  Schedule({
    required this.communities,
    required this.scheduleId, 
  });
}
