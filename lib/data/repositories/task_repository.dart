// ignore_for_file: public_member_api_docs

import 'package:gsi_test/data/adapters/task_adapter.dart';
import 'package:gsi_test/data/datasources/task_local_data_source.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';

class TaskRepository implements ITaskRepository {
  TaskRepository({required this.local});
  final ITaskLocalDataSource local;

  @override
  Future<List<Task>> getTasks() async {
    final adapter = await local.getTasks();
    final tasks = adapter.map((e) => e.toDomain()).toList();
    return tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    await local.addTask(TaskAdapt.fromDomain(task));
  }

  @override
  Future<void> deleteTask(int id) async {
    await local.deleteTask(id);
  }

  @override
  Future<void> changeStatus(Task task, TaskStatus status) async {
    task.status = status;
    await local.changeStatus(TaskAdapt.fromDomain(task), task.id!);
  }
}
