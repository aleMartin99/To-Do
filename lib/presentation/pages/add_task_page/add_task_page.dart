// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/creation_button.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/date_picker.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/description_field.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/project_picker.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/responsable_field.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/task_type_picker.dart';
import 'package:gsi_test/presentation/pages/add_task_page/widgets/title_field.dart';

class AddTaskPage extends GetView<AddTaskController> {
  const AddTaskPage({Key? key}) : super(key: key);

  //TODO(ale): añadir author
  // Widget _buildProjectTextField(AddTaskController _) {
  //   return TextFormField(
  //     textCapitalization: TextCapitalization.sentences,
  //     decoration: InputDecoration(
  //       labelText: 'I18nKeys.project.tr',
  //     ),
  //     textInputAction: TextInputAction.done,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     // validator: AppValidator.validateRequired,
  //     onSaved: (String? value) => _.project = value!,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
      builder: (addTaskController) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nueva Tarea'),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: addTaskController.formKey,
                child: Center(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      TitleField(addTaskController: addTaskController),
                      DescriptionField(addTaskController: addTaskController),
                      const SizedBox(height: 25),
                      TaskTypePicker(addTaskController: addTaskController),
                      const SizedBox(height: 20),
                      DatePicker(addTaskController: addTaskController),
                      const SizedBox(height: 10),
                      ResponsableField(addTaskController: addTaskController),
                      const SizedBox(height: 20),
                      ProjectPicker(addTaskController: addTaskController),
                      const SizedBox(height: 30),
                      CreationButton(addTaskController: addTaskController),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
