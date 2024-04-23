import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hive/community.dart';
import '../hive/schedule.dart';

Future<void> fetchAndStoreSchedule(Box<Schedule> box) async {
  while (true) {
    await fetchDataAndUpdateBox(box);
    await Future.delayed(Duration(minutes: 2));
  }
}

Future<Schedule> fetchSchedule() async {
  await Hive.initFlutter();
  await Hive.openBox<Schedule>('schedule');

  final Box<Schedule> box = Hive.box('schedule');

  // Start fetching and storing schedule data periodically
  fetchAndStoreSchedule(box);

  // Initially fetch and return the existing schedule
  return fetchDataAndUpdateBox(box);
}

Future<Schedule> fetchDataAndUpdateBox(Box<Schedule> box) async {
  final response =
      await http.get(Uri.parse('http://localhost:4000/api/schedule_details'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> communitiesData = jsonResponse['communities'];
    List<Community> communities =
        communitiesData.map((json) => Community.fromJson(json)).toList();
    String scheduleId = jsonResponse['schedule_id'];

    Schedule newSchedule =
        Schedule(communities: communities, scheduleId: scheduleId);

    // Clear previous data and store new data
    await box.clear();
    await box.put('schedule', newSchedule);

    return newSchedule;
  } else {
    print('Request failed with status: ${response.statusCode}');

    // If request failed, return the existing schedule
Schedule? existingSchedule = box.get('schedule', defaultValue: Schedule(communities: [], scheduleId: '')) ?? Schedule(communities: [], scheduleId: '');
    return existingSchedule;
  }
}