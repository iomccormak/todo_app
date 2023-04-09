part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class GetTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});
}

class DoneChange extends TasksEvent {
  final Task task;

  const DoneChange({required this.task});
}

class SortByType extends TasksEvent {
  final Sort sortType;

  const SortByType({required this.sortType});
}

class Filter extends TasksEvent {}
