import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';
import 'package:gsi_test/utils/app_routes.dart';

class AddTaskController extends GetxController {
  final ITaskRepository taskRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String title;
  late String description;
  late TaskType type;
  late DateTime fulfillmentDate;
  late String responsable;
  late TaskProject project;
  late TaskStatus status;

  AddTaskController({required this.taskRepository});

  @override
  void onInit() {
    title = '';
    description = '';
    type = TaskType.rent;
    fulfillmentDate = DateTime.now();
    responsable = '';
    project = TaskProject.project1;
    status = TaskStatus.neW;

    super.onInit();
  }

  void submitForm() {
    final currentState = formKey.currentState;
    if (currentState == null || !currentState.validate()) {
      return;
    }

    currentState.save();
    taskRepository.addTask(Task(
      title: title,
      description: description,
      status: TaskStatus.neW,
      type: type,
      fulfillmentDate: fulfillmentDate,
      responsable: responsable,
      author: 'Michael Scott',
      project: project,
    ));
    Get.offAllNamed(AppRoutes.home_page);
  }
}
