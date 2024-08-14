import 'package:flutter/material.dart';
import 'package:pomodoro_timer/widgets/CircularTimer.dart';
import 'package:pomodoro_timer/widgets/pomodoro_timer.dart';
import 'package:pomodoro_timer/widgets/task_list.dart';

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CircularTimer(),
          Expanded(
            flex: 2,
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
