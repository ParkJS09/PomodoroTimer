
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/task_model.dart';
import 'package:provider/provider.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter a new task',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Provider.of<TaskModel>(context, listen: false).addTask(_controller.text);
              _controller.clear();
            }
          },
          child: Text('Add Task'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}