// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';
import 'package:gsi_test/utils/converters.dart';

final List<DropdownMenuItem<TaskType>> _taskTypesMenuItems = TaskType.values
    .map(
      (type) => DropdownMenuItem<TaskType>(
        value: type,
        child: Text(taskTypeToString(type)),
      ),
    )
    .toList();

class TaskTypePicker extends StatefulWidget {
  const TaskTypePicker({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;

  @override
  State<TaskTypePicker> createState() => _TaskTypePickerState();
}

class _TaskTypePickerState extends State<TaskTypePicker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Tipo de Tarea',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        hint: const Text(
          'Tipo',
          style: TextStyle(color: Colors.black),
        ),
        iconEnabledColor: Get.theme.primaryColor,
        value: widget.addTaskController.type,
        onChanged: (TaskType? newValue) {
          widget.addTaskController.type = newValue!;
          widget.addTaskController.update();
        },
        items: _taskTypesMenuItems,
      ),
    );
  }
}
