import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro_model.dart';
import 'package:pomodoro_timer/widgets/TimerPainter.dart';
import 'package:provider/provider.dart';

class CircularTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pomodoroModel = context.watch<PomodoroModel>();

    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(14.0),
      child: AnimatedBuilder(
        animation: pomodoroModel.progressNotifier,
        builder: (context, child) {
          return CustomPaint(
            painter: TimerPainter(
              progress: pomodoroModel.progressNotifier.value,
              backgroundColor: Colors.white,
              color: Colors.red,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(pomodoroModel.timeLeft),
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: pomodoroModel.isActive ? pomodoroModel.stopTimer : pomodoroModel.startTimer,
                        child: Text(pomodoroModel.isActive ? 'PAUSE' : 'START'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.red),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: pomodoroModel.resetTimer,
                        child: Text('RESET'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
