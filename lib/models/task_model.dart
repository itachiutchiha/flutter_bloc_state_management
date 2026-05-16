class TaskModel {
  final int id;
  final String task;
  bool isChecked;

  TaskModel({required this.id, required this.task, this.isChecked = false});

  TaskModel copyWith({int? id, String? task, bool? isChecked}) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
