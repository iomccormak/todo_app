part of 'tasks_bloc.dart';

abstract class TasksState {
  const TasksState();
}

class TasksInitial extends TasksState {}

class TasksEmptyState extends TasksState {}

class GetTasksState extends TasksState {
  final List<Task> tasks;

  const GetTasksState({required this.tasks});
}
