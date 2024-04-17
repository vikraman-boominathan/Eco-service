import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hive/community.dart';
import '../hive/schedule.dart';


Future<Schedule> fetchSchedule() async {
  await Hive.initFlutter();
  await Hive.openBox<Schedule>('schedule');

  final Box<Schedule> box = Hive.box('schedule');

  if (box.isNotEmpty) {
    Schedule schedule = box.get('schedule')!;

    return schedule;
  } else {
    final response =
        await http.get(Uri.parse('http://localhost:4000/api/schedule_details'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> communitiesData = jsonResponse['communities'];
      List<Community> communities =
          communitiesData.map((json) => Community.fromJson(json)).toList();
      String scheduleId = jsonResponse['schedule_id'];
      
      Schedule schedule =
          Schedule(communities: communities, scheduleId: scheduleId);
      await box.put('schedule', schedule);

      return schedule;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return Schedule(communities: [], scheduleId: '');
    }
  }
}
