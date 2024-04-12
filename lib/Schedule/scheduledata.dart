import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'scheduleList.dart';

class ScheduleData {
  final String communityId;
  final String schedule_id;

  ScheduleData({
    required this.communityId,
    required this.schedule_id,
   
  });

  factory ScheduleData.fromJson(Map<String, dynamic> json) {
    return ScheduleData(
      communityId: json['community_id'],
      schedule_id: json['schedule_id'],
      
    );
  }
}

Future<ScheduleData?> createScheduleData( ScheduleData scheduleData) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:4000/api/add_schedules'));
    request.body = json.encode({
      'community_id': scheduleData.communityId,
      'schedule_id': scheduleData.schedule_id,
      
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);

    if (response.statusCode == 201) {
      final responseBody = await utf8.decodeStream(response.stream);
      // getDetails();
      print(responseBody);
    }
}