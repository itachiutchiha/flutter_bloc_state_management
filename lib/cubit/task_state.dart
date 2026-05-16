part of 'task_cubit.dart';

class TaskState extends Equatable {
  const TaskState({required this.tasks});
  final List<TaskModel> tasks;

  @override
  // TODO: implement props
  List<Object?> get props => [tasks];
}
