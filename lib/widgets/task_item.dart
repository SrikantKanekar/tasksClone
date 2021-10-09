import 'package:flutter/material.dart';
import 'package:tasks/model/task.dart';
import 'package:tasks/screens/task_screen.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          task.completed ? Icons.check : Icons.radio_button_off,
        ),
      ),
      title: Text(task.name),
      onTap: (){
        Navigator.of(context).pushNamed(TaskScreen.routeName, arguments: task);
      },
    );
  }
}