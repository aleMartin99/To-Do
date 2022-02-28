// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class CreationButton extends StatefulWidget {
  const CreationButton({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;

  @override
  State<CreationButton> createState() => _CreationButtonState();
}

class _CreationButtonState extends State<CreationButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RawMaterialButton(
        fillColor: Get.theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
        ),
        onPressed: widget.addTaskController.submitForm,
        child: const Text(
          'CREAR',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
