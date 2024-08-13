import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/task_model.dart';
import 'package:pomodoro_timer/widgets/task_form.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskModel = Provider.of<TaskModel>(context);

    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Tasks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskModel.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(taskModel.tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => taskModel.removeTask(index),
                  ),
                );
              },
            ),
          ),
          AddTaskForm(),
        ],
      ),
    );
  }
}