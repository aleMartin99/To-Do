import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_binding.dart';
import 'package:gsi_test/presentation/controllers/home/home_binding.dart';
import 'package:gsi_test/presentation/pages/add_task_page/add_task_page.dart';
import 'package:gsi_test/presentation/pages/home_page/home_page.dart';
import 'package:gsi_test/utils/app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage<GetPage>(
      name: AppRoutes.home_page,
      page: () => const HomePage(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: AppRoutes.addTask_page,
      page: () => AddTaskPage(),
      binding: AddTaskControllerBinding(),
    ),
  ];
}
