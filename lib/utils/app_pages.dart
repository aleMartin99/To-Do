// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_binding.dart';
import 'package:gsi_test/presentation/controllers/home/home_binding.dart';
import 'package:gsi_test/presentation/pages/add_task_page/add_task_page.dart';
import 'package:gsi_test/presentation/pages/home_page/home_page.dart';
import 'package:gsi_test/utils/app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage<dynamic>(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeControllerBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.addTaskPage,
      page: AddTaskPage.new,
      binding: AddTaskControllerBinding(),
    ),
  ];
}
