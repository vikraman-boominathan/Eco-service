import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Community/CommunityMain.dart';
import 'Community/community.g.dart';
import 'Schedule/scheduleDetails.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CommunityAdapter());
  await Hive.openBox<Community>('community_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/communityMain': (context) => const CommunityMain(),
      },
      home: const ScheduleDetailScreen(),
    );
  }
}
