// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskListDao? _taskListDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TaskListEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `tasks` TEXT NOT NULL, `order` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskListDao get taskListDao {
    return _taskListDaoInstance ??= _$TaskListDao(database, changeListener);
  }
}

class _$TaskListDao extends TaskListDao {
  _$TaskListDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskListEntityInsertionAdapter = InsertionAdapter(
            database,
            'TaskListEntity',
            (TaskListEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'tasks': item.tasks,
                  'order': item.order
                },
            changeListener),
        _taskListEntityUpdateAdapter = UpdateAdapter(
            database,
            'TaskListEntity',
            ['id'],
            (TaskListEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'tasks': item.tasks,
                  'order': item.order
                },
            changeListener),
        _taskListEntityDeletionAdapter = DeletionAdapter(
            database,
            'TaskListEntity',
            ['id'],
            (TaskListEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'tasks': item.tasks,
                  'order': item.order
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskListEntity> _taskListEntityInsertionAdapter;

  final UpdateAdapter<TaskListEntity> _taskListEntityUpdateAdapter;

  final DeletionAdapter<TaskListEntity> _taskListEntityDeletionAdapter;

  @override
  Future<List<TaskListEntity>> getAllTaskLists() async {
    return _queryAdapter.queryList('SELECT * FROM TaskListEntity',
        mapper: (Map<String, Object?> row) => TaskListEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            tasks: row['tasks'] as String,
            order: row['order'] as int));
  }

  @override
  Stream<List<TaskListEntity>> getAllTaskListsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM TaskListEntity',
        mapper: (Map<String, Object?> row) => TaskListEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            tasks: row['tasks'] as String,
            order: row['order'] as int),
        queryableName: 'TaskListEntity',
        isView: false);
  }

  @override
  Future<TaskListEntity?> getListByName(String name) async {
    return _queryAdapter.query('SELECT * FROM TaskListEntity WHERE name = ?1',
        mapper: (Map<String, Object?> row) => TaskListEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            tasks: row['tasks'] as String,
            order: row['order'] as int),
        arguments: [name]);
  }

  @override
  Future<void> insertList(TaskListEntity taskList) async {
    await _taskListEntityInsertionAdapter.insert(
        taskList, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<TaskListEntity> taskLists) async {
    await _taskListEntityInsertionAdapter.insertList(
        taskLists, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateList(TaskListEntity taskList) async {
    await _taskListEntityUpdateAdapter.update(
        taskList, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAll(List<TaskListEntity> taskLists) async {
    await _taskListEntityUpdateAdapter.updateList(
        taskLists, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteList(TaskListEntity taskList) async {
    await _taskListEntityDeletionAdapter.delete(taskList);
  }

  @override
  Future<void> deleteAll(List<TaskListEntity> taskLists) async {
    await _taskListEntityDeletionAdapter.deleteList(taskLists);
  }
}
