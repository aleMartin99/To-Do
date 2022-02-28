import 'package:gsi_test/data/adapters/task_adapter.dart';
import 'package:gsi_test/data/local_db/cache_manager.dart';
import 'package:gsi_test/data/local_db/const.dart';

abstract class ITaskLocalDataSource {
  Future<List<TaskAdapt>> getTasks();
  Future<void> addTask(TaskAdapt task);
  Future<void> deleteTask(int id);
  Future<void> changeStatus(TaskAdapt taskAdapt, int id);
}

class TaskLocalDataSource implements ITaskLocalDataSource {
  final CacheManager cacheManager;

  TaskLocalDataSource({required this.cacheManager});

  @override
  Future<List<TaskAdapt>> getTasks() {
    return cacheManager.getAll(CacheBoxes.tasksBox);
  }

  @override
  Future<void> addTask(TaskAdapt task) async {
    await cacheManager.add<TaskAdapt>(task, CacheBoxes.tasksBox);
  }

  @override
  Future<void> deleteTask(int id) async {
    await cacheManager.delete(id, CacheBoxes.tasksBox);
  }

  @override
  Future<void> changeStatus(TaskAdapt taskAdapt, int id) async {
    await cacheManager.changeStatus(CacheBoxes.tasksBox, taskAdapt, id);
  }
}
