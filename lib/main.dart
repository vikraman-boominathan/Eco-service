import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Community/CommunityMain.dart';
import 'hive/community.dart';
import 'Schedule/scheduleDetails.dart';

import 'hive/communityData.dart';
import 'hive/schedule.dart';
import 'hive/scheduleData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   // Register adapters
  Hive.registerAdapter(CommunityAdapter());
  Hive.registerAdapter(ScheduleAdapter());
  // Hive.registerAdapter(ScheduleDataAdapter());
  // Hive.registerAdapter(CommunityDataAdapter());
  
  // Open boxes
  await Hive.openBox<Community>('communities'); 
  await Hive.openBox<Schedule>('schedule'); 
  // await Hive.openBox<ScheduleData>('scheduleData'); 
  // await Hive.openBox<CommunityData>('communityData'); 
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
