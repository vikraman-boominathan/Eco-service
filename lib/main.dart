import 'package:flutter/material.dart';
import 'Community/CommunityMain.dart';
import 'Schedule/scheduleDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/communityMain': (context) => CommunityMain(),
      },
      home: ScheduleDetails(),
    );
  }
}
