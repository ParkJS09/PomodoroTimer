import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro_model.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pomodoroModel = Provider.of<PomodoroModel>(context);

    String formatTime(int timeInSeconds) {
      int minutes = timeInSeconds ~/ 60;
      int seconds = timeInSeconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    return Container(
      color: Colors.red[300],
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pomodoro',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            formatTime(pomodoroModel.timeLeft),
            style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pomodoroModel.isActive ? pomodoroModel.stopTimer : pomodoroModel.startTimer,
                child: Text(pomodoroModel.isActive ? 'PAUSE' : 'START'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: pomodoroModel.resetTimer,
                child: Text('RESET'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}