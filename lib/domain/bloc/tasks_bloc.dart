import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/models/sorts.dart';
import 'package:todo_app/domain/models/task.dart';
import 'package:todo_app/domain/repository/tasks_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository repository;

  List<Task> _doneTasks = [];
  List<Task> _undoneTasks = [];
  bool _show = true;
  Sort _sortType = Sort.descendingSort;

  TasksBloc({required this.repository}) : super(TasksInitial()) {
    on<GetTasks>(_onGetTasks);
    on<AddTask>(_onAddTask);
    on<DoneChange>(_onDoneChange);
    on<SortByType>(_onSortByType);
    on<Filter>(_onFilter);
  }

  Future<void> _onGetTasks(GetTasks event, Emitter<TasksState> emit) async {
    _doneTasks = await repository.getDoneTasks();
    _undoneTasks = await repository.getUndoneTasks();
    _showAll(emit);
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    _undoneTasks.add(event.task);
    _sort(_sortType, _doneTasks, _undoneTasks);
    repository.addTask(event.task);
    emit(GetTasksState(
      tasks: _hideFilter(),
      filterStatus: _show,
      sortType: _sortType,
    ));
  }

  Future<void> _onDoneChange(DoneChange event, Emitter<TasksState> emit) async {
    final task = event.task;

    if (task.isDone) {
      _undoneTasks.add(task.copyWith(isDone: false));
      _sort(_sortType, _doneTasks, _undoneTasks);
      _doneTasks.removeWhere((t) => t.id == task.id);
    } else {
      _doneTasks.add(task.copyWith(isDone: true));
      _sort(_sortType, _doneTasks, _undoneTasks);
      _undoneTasks.removeWhere((t) => t.id == task.id);
    }
    repository.doneChangeTask(event.task.copyWith(isDone: !event.task.isDone));
    _showAll(emit);
  }

  Future<void> _onSortByType(SortByType event, Emitter<TasksState> emit) async {
    _sortType = event.sortType;
    _sort(_sortType, _doneTasks, _undoneTasks);
    _showAll(emit);
  }

  Future<void> _onFilter(Filter event, Emitter<TasksState> emit) async {
    _show = !_show;
    emit(GetTasksState(
      tasks: _hideFilter(),
      filterStatus: _show,
      sortType: _sortType,
    ));
  }

  void _showAll(Emitter<TasksState> emit) {
    _doneTasks.isEmpty && _undoneTasks.isEmpty
        ? emit(TasksEmptyState())
        : emit(GetTasksState(
            tasks: _hideFilter(),
            filterStatus: _show,
            sortType: _sortType,
          ));
  }

  List<Task> _hideFilter() {
    if (_show) {
      return _undoneTasks + _doneTasks;
    } else {
      return _undoneTasks;
    }
  }

  void _sort(Sort sort, List<Task> done, List<Task> undone) {
    switch (sort) {
      case Sort.descendingSort:
        done.sort((a, b) => a.title.compareTo(b.title));
        undone.sort((a, b) => a.title.compareTo(b.title));
        break;
      case Sort.ascendingSort:
        done.sort((a, b) => b.title.compareTo(a.title));
        undone.sort((a, b) => b.title.compareTo(a.title));
        break;
      case Sort.dateSort:
        done.sort((a, b) => a.date.compareTo(b.date));
        undone.sort((a, b) => a.date.compareTo(b.date));
        break;
    }
  }
}
