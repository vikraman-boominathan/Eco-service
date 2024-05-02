import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Community/CommunityMain.dart';
import 'hive/community.dart';
import 'Schedule/scheduleDetails.dart';

import 'hive/communityData.dart';
import 'hive/schedule.dart';
import 'l10n/app_en.arb';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CommunityAdapter());
  await Hive.openBox<Community>('communities');
  Hive.registerAdapter(ScheduleAdapter());
  await Hive.openBox<Schedule>('schedule');
  // Hive.registerAdapter(ScheduleDataAdapter());
  // await Hive.openBox('scheduleData');
  Hive.registerAdapter(CommunityDataAdapter());
  await Hive.openBox<CommunityData>('communityData');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,  
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('tn'), // Tamil
      ],

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
