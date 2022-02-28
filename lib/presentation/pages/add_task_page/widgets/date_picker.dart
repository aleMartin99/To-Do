// ignore_for_file: cascade_invocations, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

Future<void> _selectDate(
  BuildContext context,
  AddTaskController addTaskController,
) async {
  // ignore: omit_local_variable_types
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: addTaskController.fulfillmentDate,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(days: 365),
    ),
  );
  if (picked != null && picked != addTaskController.fulfillmentDate) {
    addTaskController.fulfillmentDate = picked;
    addTaskController.update();
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Get.theme.primaryColor,
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Fecha de cumplimiento',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${widget.addTaskController.fulfillmentDate.toLocal()}'
                .split(' ')[0],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: Icon(
              Icons.calendar_today_rounded,
              color: Get.theme.primaryColor,
            ),
            onPressed: () {
              _selectDate(Get.context!, widget.addTaskController);
            },
          ),
        ],
      ),
    );
  }
}
