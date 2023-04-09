import 'package:todo_app/domain/models/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getDoneTasks();
  Future<List<Task>> getUndoneTasks();
  void addTask(Task task);
  void doneChangeTask(Task task);
}
