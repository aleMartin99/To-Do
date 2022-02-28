// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/home/home_controller.dart';
import 'package:gsi_test/presentation/pages/home_page/widgets/task_card.dart';
import 'package:gsi_test/utils/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Lista de Deseos',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          body: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: homeController.tasks
                  .map(
                    (task) => TaskCard(
                      //addTaskController: addTaskController,
                      task: task,
                      homeController: homeController,
                    ),
                  )
                  .toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed<dynamic>(AppRoutes.addTaskPage),
            tooltip: 'Añadir Nueva Tarea',
            child: const Icon(Icons.add_rounded),
          ),
        );
      },
    );
  }
}
