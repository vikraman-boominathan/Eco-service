import 'package:eco_service/api/communityList.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../hive/community.dart';


class ScheduleDetails {
  final List<Community> communities;
  final String scheduleId;

  ScheduleDetails({
    required this.communities,
    required this.scheduleId,
  });

  
}
Future<ScheduleDetails> fetchScheduleDetails() async {
  final response = await http.get(Uri.parse('http://localhost:4000/api/schedule_details'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> communitiesData = jsonResponse['communities'];
    List<Community> communities = communitiesData.map((json) => Community.fromJson(json)).toList();
    String scheduleId = jsonResponse['schedule_id'];
    return ScheduleDetails(communities: communities, scheduleId: scheduleId);
  } else {
    print('Request failed with status: ${response.statusCode}');
    // Return an empty list or null based on your error handling preference
    return ScheduleDetails(communities: [], scheduleId: '');
  }
}

Future<ScheduleDetails> getDetails() async {
  ScheduleDetails scheduleDetails = await fetchScheduleDetails();
  
  // Access communities
  List<Community> communities = scheduleDetails.communities;
  
  // Access schedule ID
  String scheduleId = scheduleDetails.scheduleId;

  // Use communities and scheduleId as needed
  return scheduleDetails;
}

