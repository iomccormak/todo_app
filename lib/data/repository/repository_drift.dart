import 'package:drift/drift.dart';
import 'package:todo_app/data/datasource/local/db_drift.dart';
import 'package:todo_app/domain/models/task.dart';
import 'package:todo_app/domain/repository/tasks_repository.dart';

class DriftTaskRepository extends TasksRepository {
  final repository = MyDb();

  @override
  Future<List<Task>> getDoneTasks() async {
    List<DbDriftData> dbTasks = await repository.orderTasks(true);
    Iterable<Task> tasks = dbTasks.map(
      (t) => Task(id: t.id, title: t.title, date: t.date, isDone: t.isDone),
    );
    return tasks.toList();
  }

  @override
  Future<List<Task>> getUndoneTasks() async {
    List<DbDriftData> dbTasks = await repository.orderTasks(false);
    Iterable<Task> tasks = dbTasks.map(
      (t) => Task(id: t.id, title: t.title, date: t.date, isDone: t.isDone),
    );
    return tasks.toList();
  }

  @override
  void addTask(Task task) async {
    await repository.addTask(
      DbDriftCompanion(
        id: Value<String>(task.id),
        title: Value<String>(task.title),
        date: Value<DateTime>(task.date),
        isDone: Value<bool>(task.isDone),
      ),
    );
  }

  @override
  void doneChangeTask(Task task) {
    repository.editTask(
      task.id,
      DbDriftCompanion(
        isDone: Value<bool>(task.isDone),
      ),
    );
  }
}
