import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

Future<ScheduleData?> createScheduleData( ScheduleData scheduleData,BuildContext context) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:4000/api/add_waste'));
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

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("$responseBody"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

      
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to create community data: ${response.reasonPhrase}"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      
    }
  } catch (e) {
    print('Error: $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("An error occurred: $e"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
    
  }
}