import 'dart:io';

import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db_drift.g.dart';

class DbDrift extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isDone => boolean()();
}

@DriftDatabase(tables: [DbDrift])
class MyDb extends _$MyDb {
  MyDb() : super(_openConnection());

  Future<List<DbDriftData>> get allTasks => select(dbDrift).get();

  Future<int> addTask(DbDriftCompanion entry) {
    return into(dbDrift).insert(entry);
  }

  Future editTask(String id, DbDriftCompanion taskCompanion) {
    return (update(dbDrift)..where((task) => task.id.equals(id)))
        .write(taskCompanion);
  }

  Future deleteTask(String id) {
    return (delete(dbDrift)..where((task) => task.id.equals(id))).go();
  }

  Future<List<DbDriftData>> orderTasks(bool isDone) {
    return (select(dbDrift)
          ..where((task) => task.isDone.equals(isDone))
          ..orderBy([(task) => OrderingTerm(expression: task.title)]))
        .get();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
