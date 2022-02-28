// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';
import 'package:gsi_test/utils/converters.dart';

final List<DropdownMenuItem<TaskProject>> _taskProjectsMenuItems =
    TaskProject.values
        .map(
          (project) => DropdownMenuItem<TaskProject>(
            value: project,
            child: Text(taskProjectToString(project)),
          ),
        )
        .toList();

class ProjectPicker extends StatefulWidget {
  const ProjectPicker({Key? key, required this.addTaskController})
      : super(key: key);

  final AddTaskController addTaskController;
  @override
  State<ProjectPicker> createState() => _ProjectPickerState();
}

class _ProjectPickerState extends State<ProjectPicker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Seleccione el Proyecto',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        hint: const Text('Proyecto'),
        iconEnabledColor: Get.theme.primaryColor,
        value: widget.addTaskController.project,
        onChanged: (TaskProject? newValue) {
          widget.addTaskController.project = newValue!;
          widget.addTaskController.update();
        },
        items: _taskProjectsMenuItems,
      ),
    );
  }
}
