import 'package:get/get.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';
import 'package:gsi_test/domain/service_container/service_container.dart';
import 'package:gsi_test/presentation/controllers/home/home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        taskRepository: sl<ITaskRepository>(),
      ),
      fenix: true,
    );
  }
}
