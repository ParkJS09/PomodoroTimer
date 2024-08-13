import 'package:flutter/material.dart';
import 'package:pomodoro_timer/layout/desktop_layout.dart';
import 'package:pomodoro_timer/layout/mobile_layout.dart';
import 'package:pomodoro_timer/layout/reponsive_layout.dart';
import 'package:pomodoro_timer/layout/tablet_layout.dart';

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(primarySwatch: Colors.red),
      home: ResponsiveLayout(
        mobileBody: MobileLayout(),
        tabletBody: TabletLayout(),
        desktopBody: DesktopLayout(),
      ),
    );
  }
}