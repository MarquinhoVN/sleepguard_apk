import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepguard_app/core/core.dart';

class SleepguardApp extends StatelessWidget {
  const SleepguardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.global,
      child: MaterialApp(
        title: 'Sleepguard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: Pages.pages,
        initialRoute: Routes.home,
      ),
    );
  }
}