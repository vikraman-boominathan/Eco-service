import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../hive/scheduleData.dart';


  Future<void> createScheduleData(ScheduleData scheduleData) async {
    var box =
        await Hive.openBox('scheduleData'); 

    
    await box.add(scheduleData.toJson());

    print(box.values);

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://localhost:4000/api/add_schedules'));
    request.body = json.encode({
      'community_id': scheduleData.communityId,
      'schedule_id': scheduleData.schedule_id,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);

    if (response.statusCode == 201) {
      final responseBody = await utf8.decodeStream(response.stream);
      print(responseBody);

    }
  }

