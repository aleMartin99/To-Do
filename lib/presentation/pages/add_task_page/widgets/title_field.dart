// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class TitleField extends StatefulWidget {
  const TitleField({Key? key, required this.addTaskController})
      : super(key: key);
  final AddTaskController addTaskController;

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Título',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (String? value) => widget.addTaskController.title = value!,
    );
  }
}
