import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management_learn/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(tasks: []));

  void addTask(TaskModel newTask) {
    final newList = [...state.tasks, newTask];
    emit(TaskState(tasks: newList));
  }

  void togggleTask(int id) {
    final newList = state.tasks
        .map((e) => e.id != id ? e : e.copyWith(isChecked: !e.isChecked))
        .toList();

    emit(TaskState(tasks: newList));
  }

  void removeTask(int id) {
    final newList = state.tasks.where((element) => element.id != id).toList();
    emit(TaskState(tasks: newList));
  }
}
