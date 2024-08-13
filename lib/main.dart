import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro_model.dart';
import 'package:pomodoro_timer/models/task_model.dart';
import 'package:pomodoro_timer/pomodoro_app.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PomodoroModel()),
        ChangeNotifierProvider(create: (context) => TaskModel()),
      ],
      child: PomodoroApp(),
    ),
  );
}
