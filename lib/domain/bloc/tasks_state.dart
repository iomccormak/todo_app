part of 'tasks_bloc.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksEmptyState extends TasksState {}

class GetTasksState extends TasksState {
  final List<Task> tasks;
  final bool filterStatus;
  final Sort sortType;

  GetTasksState({
    required this.tasks,
    required this.filterStatus,
    required this.sortType,
  });
}
