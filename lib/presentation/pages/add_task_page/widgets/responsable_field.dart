// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class ResponsableField extends StatefulWidget {
  const ResponsableField({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;
  @override
  State<ResponsableField> createState() => _ResponsableFieldState();
}

class _ResponsableFieldState extends State<ResponsableField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Responsable',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: AppValidator.validateRequired,
      onSaved: (String? value) => widget.addTaskController.responsable = value!,
    );
  }
}
