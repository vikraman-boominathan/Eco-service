import 'package:eco_service/Community/communityList.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ScheduleDetails {
  final List<Community> communities;
  final String scheduleId;

  ScheduleDetails({
    required this.communities,
    required this.scheduleId,
  });

  
}
Future<void> fetchAndSaveScheduleDetails() async {
  final response = await http.get(Uri.parse('http://localhost:4000/api/schedule_details'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> communitiesData = jsonResponse['communities'];
    final List<Community> communities = communitiesData.map((json) => Community.fromJson(json)).toList();
    final String scheduleId = jsonResponse['schedule_id'];

    final box = Hive.box('communitiesBox');
    box.put('communities', communities);
    box.put('scheduleId', scheduleId);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

// Future<ScheduleDetails> getDetails() async {
//   ScheduleDetails scheduleDetails = await fetchAndSaveScheduleDetails();
  
//   // Access communities
//   List<Community> communities = scheduleDetails.communities;
  
//   // Access schedule ID
//   String scheduleId = scheduleDetails.scheduleId;

//   // Use communities and scheduleId as needed
//   return scheduleDetails;
// }

