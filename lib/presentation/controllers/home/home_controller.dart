import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';

class HomeController extends GetxController {
  final ITaskRepository taskRepository;

  List<Task> tasks = [];

  HomeController({required this.taskRepository});

  @override
  Future<void> onInit() async {
    tasks = await taskRepository.getTasks();
    update();
    super.onInit();
  }

  Future<void> deleteTask(int id) async {
    await taskRepository.deleteTask(id);
    tasks.removeWhere((task) => task.id == id);
    update();
  }

  Future<void> changeStatus(Task task, TaskStatus status) async {
    await taskRepository.changeStatus(task, status);
    //tasks.removeWhere((task) => task.id == id);
    update();
  }
}
