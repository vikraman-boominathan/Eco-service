import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'Community/CommunityMain.dart';
import 'hive/community.dart';
import 'Schedule/scheduleDetails.dart';

import 'hive/communityData.dart';
import 'hive/schedule.dart';
import 'provider/locale_provider.dart';

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

  runApp(ChangeNotifierProvider(
      create: (_) => LocaleNotifier(),
      child: MyApp(),
    ),);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleNotifier>(
      builder: (context, localeNotifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
          ],
          locale: localeNotifier.locale,
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            '/communityMain': (context) => const CommunityMain(),
          },
          home: const ScheduleDetailScreen(),
        );
      },
    );
  }
}
