import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/cubit/task_cubit.dart';
import 'package:state_management_learn/models/task_model.dart';

class TaskScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const TaskScreen();

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final CubitController = context.read<TaskCubit>();
          return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  leading: Checkbox(
                      onChanged: (value) => CubitController.togggleTask(index),
                      value: task.isChecked),
                  title: Text(task.task.toString()),
                  trailing: IconButton(
                    onPressed: () => CubitController.removeTask(task.id),
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final CubitController = context.read<TaskCubit>();
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Enter task name...'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _textController.clear();
                Navigator.of(dialogContext).pop(); // Close popup
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  CubitController.addTask(TaskModel(
                      id: CubitController.state.tasks.length,
                      task: _textController.text));
                  _textController.clear(); // Clear text field
                }
                Navigator.of(dialogContext).pop(); // Close popup
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
