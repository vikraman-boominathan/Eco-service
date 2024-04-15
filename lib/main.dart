import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Community/CommunityMain.dart';
import 'hive/community.dart';
import 'Schedule/scheduleDetails.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CommunityAdapter());
  await Hive.openBox<Community>('communities');
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
      home: ScheduleDetailScreen(),
    );
  }
}
