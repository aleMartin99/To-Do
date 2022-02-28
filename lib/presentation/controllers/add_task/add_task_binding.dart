import 'package:get/get.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';
import 'package:gsi_test/domain/service_container/service_container.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class AddTaskControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(
      () => AddTaskController(
        taskRepository: sl<ITaskRepository>(),
      ),
      fenix: true,
    );
  }
}
