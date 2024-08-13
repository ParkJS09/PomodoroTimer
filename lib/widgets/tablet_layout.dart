import 'package:flutter/material.dart';
import 'package:pomodoro_timer/widgets/pomodoro_timer.dart';
import 'package:pomodoro_timer/widgets/task_list.dart';

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: PomodoroTimer(),
          ),
          Expanded(
            flex: 1,
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}