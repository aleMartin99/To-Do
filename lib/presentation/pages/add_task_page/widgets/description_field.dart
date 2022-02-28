// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;
  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Descripción',
      ),
      maxLines: 3,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (String? value) => widget.addTaskController.description = value!,
    );
  }
}
