// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_drift.dart';

// ignore_for_file: type=lint
class $DbDriftTable extends DbDrift with TableInfo<$DbDriftTable, DbDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone =
      GeneratedColumn<bool>('is_done', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [id, title, date, isDone];
  @override
  String get aliasedName => _alias ?? 'db_drift';
  @override
  String get actualTableName => 'db_drift';
  @override
  VerificationContext validateIntegrity(Insertable<DbDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    } else if (isInserting) {
      context.missing(_isDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DbDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
    );
  }

  @override
  $DbDriftTable createAlias(String alias) {
    return $DbDriftTable(attachedDatabase, alias);
  }
}

class DbDriftData extends DataClass implements Insertable<DbDriftData> {
  final String id;
  final String title;
  final DateTime date;
  final bool isDone;
  const DbDriftData(
      {required this.id,
      required this.title,
      required this.date,
      required this.isDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['is_done'] = Variable<bool>(isDone);
    return map;
  }

  DbDriftCompanion toCompanion(bool nullToAbsent) {
    return DbDriftCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      isDone: Value(isDone),
    );
  }

  factory DbDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDriftData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      isDone: serializer.fromJson<bool>(json['isDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'isDone': serializer.toJson<bool>(isDone),
    };
  }

  DbDriftData copyWith(
          {String? id, String? title, DateTime? date, bool? isDone}) =>
      DbDriftData(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        isDone: isDone ?? this.isDone,
      );
  @override
  String toString() {
    return (StringBuffer('DbDriftData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('isDone: $isDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, isDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDriftData &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.isDone == this.isDone);
}

class DbDriftCompanion extends UpdateCompanion<DbDriftData> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<bool> isDone;
  final Value<int> rowid;
  const DbDriftCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.isDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbDriftCompanion.insert({
    required String id,
    required String title,
    required DateTime date,
    required bool isDone,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        date = Value(date),
        isDone = Value(isDone);
  static Insertable<DbDriftData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<bool>? isDone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (isDone != null) 'is_done': isDone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? date,
      Value<bool>? isDone,
      Value<int>? rowid}) {
    return DbDriftCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbDriftCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('isDone: $isDone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDb extends GeneratedDatabase {
  _$MyDb(QueryExecutor e) : super(e);
  late final $DbDriftTable dbDrift = $DbDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbDrift];
}
