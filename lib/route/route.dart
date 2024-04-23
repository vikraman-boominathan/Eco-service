import 'package:flutter/material.dart';
import '../Community/CommunityMain.dart';
import '../Schedule/scheduleDetails.dart';

const String communityMain = "communityMain";
const String schedule_details = "schedule";


Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case communityMain:
      return MaterialPageRoute(
        builder: (context) => CommunityMain(),
      );
    case schedule_details:
      return MaterialPageRoute(
        builder: (context) => ScheduleDetailScreen(),
      );
    
    default:
      throw ("This route does not exist");
  }
}