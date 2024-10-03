import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_timer/models/pomodoro_model.dart';
import 'package:pomodoro_timer/widgets/TimerPainter.dart';

class CircularTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pomodoroModel = context.watch<PomodoroModel>();

    return Container(
      padding: EdgeInsets.all(20),
      child: AnimatedBuilder(
        animation: pomodoroModel.progressNotifier,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(300, 300),
                painter: TimerPainter(
                  progress: pomodoroModel.progressNotifier.value,
                  backgroundColor: Colors.blue[100]!,
                  color: Colors.blue[600]!,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(pomodoroModel.timeLeft),
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _getMotivationalText(pomodoroModel.timeLeft),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[600],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAnimatedButton(
                        icon: pomodoroModel.isActive
                            ? Icons.pause
                            : Icons.play_arrow,
                        onPressed: pomodoroModel.isActive
                            ? pomodoroModel.stopTimer
                            : pomodoroModel.startTimer,
                      ),
                      SizedBox(width: 20),
                      _buildAnimatedButton(
                        icon: Icons.refresh,
                        onPressed: pomodoroModel.resetTimer,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnimatedButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue[200]!,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 36),
      ),
    );
  }

  String _formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getMotivationalText(int timeLeft) {
    if (timeLeft > 1200) return '집중할 시간이야!';
    if (timeLeft > 600) return '잘하고 ��어!';
    if (timeLeft > 300) return '거의 다 왔어!';
    return '조금만 더 힘내!';
  }
}
