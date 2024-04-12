import 'package:eco_service/Community/communityList.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Community/community.g.dart';

class ScheduleDetails {
  final List<Community> communities;
  final String scheduleId;

  ScheduleDetails({
    required this.communities,
    required this.scheduleId,
  });

  
}

Future<ScheduleDetails> fetchScheduleDetails() async {
  final Box<ScheduleDetails> box = await Hive.openBox<ScheduleDetails>('schedule_details_box');

  if (box.isNotEmpty) {
    ScheduleDetails scheduleDetails = box.getAt(0)!;
    await box.close();
    return scheduleDetails;
  }

  final response = await http.get(Uri.parse('http://localhost:4000/api/schedule_details'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> communitiesData = jsonResponse['communities'];
    List<Community> communities = communitiesData.map((json) => Community(
      id: json['community_id'] as String? ?? '',
      location: json['community_location'] as String? ?? '',
      name: json['community_name'] as String? ?? '',
      gatePhotoFileName: json['gate_photo_file_name'] as String? ?? '',
      lat: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      long: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    )).toList();
    String scheduleId = jsonResponse['schedule_id'];

    ScheduleDetails scheduleDetails = ScheduleDetails(communities: communities, scheduleId: scheduleId);
    await box.add(scheduleDetails);
    await box.close();
    return scheduleDetails;
  } else {
    await box.close();
    throw Exception('Failed to load schedule details');
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
