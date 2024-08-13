import 'package:flutter/material.dart';
import 'package:pomodoro_timer/widgets/pomodoro_timer.dart';
import 'package:pomodoro_timer/widgets/task_list.dart';

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PomodoroTimer(),
          Expanded(child: TaskList(),),
        ],
      ),
    );
  }
}