import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';

abstract class ITaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(int id);
  Future<void> changeStatus(Task task, TaskStatus status);
}
