import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';
import 'package:gsi_test/utils/converters.dart';

class AddTaskPage extends GetView<AddTaskController> {
  AddTaskPage({Key? key}) : super(key: key);

  Future<void> _selectDate(
      BuildContext context, AddTaskController addTaskController) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: addTaskController.fulfillmentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != addTaskController.fulfillmentDate) {
      addTaskController.fulfillmentDate = picked;
      addTaskController.update();
    }
  }

  final List<DropdownMenuItem<TaskType>> _taskTypesMenuItems = TaskType.values
      .map((type) => DropdownMenuItem<TaskType>(
            value: type,
            child: Text(taskTypeToString(type)),
          ))
      .toList();

  final List<DropdownMenuItem<TaskProject>> _taskProjectsMenuItems =
      TaskProject.values
          .map((project) => DropdownMenuItem<TaskProject>(
                value: project,
                child: Text(taskProjectToString(project)),
              ))
          .toList();

  Widget _buildTitleTextField(AddTaskController addTaskController) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Título',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: AppValidator.validateRequired,
      onSaved: (String? value) => addTaskController.title = value!,
    );
  }

  Widget _buildDescriptionTextField(AddTaskController addTaskController) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Descripción',
      ),
      maxLines: 3,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //  validator: AppValidator.validateRequired,
      onSaved: (String? value) => addTaskController.description = value!,
    );
  }

  Widget _buildTaskTypePicker(AddTaskController addTaskController) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Tipo de Tarea',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        hint: Text('Tipo'),
        iconEnabledColor: Get.theme.primaryColor,
        value: addTaskController.type,
        onChanged: (TaskType? newValue) {
          addTaskController.type = newValue!;
          addTaskController.update();
        },
        items: _taskTypesMenuItems,
      ),
    );
  }

  Widget _buildDatePicker(AddTaskController addTaskController) {
    return ListTile(
      selectedTileColor: Get.theme.primaryColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Fecha de cumplimiento',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${addTaskController.fulfillmentDate.toLocal()}".split(' ')[0],
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
              _selectDate(Get.context!, addTaskController);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResponsableTextField(AddTaskController addTaskController) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Responsable',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: AppValidator.validateRequired,
      onSaved: (String? value) => addTaskController.responsable = value!,
    );
  }

  Widget __buildProjectPicker(AddTaskController addTaskController) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Seleccione el Proyecto',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        hint: Text('Proyecto'),
        iconEnabledColor: Get.theme.primaryColor,
        value: addTaskController.project,
        onChanged: (TaskProject? newValue) {
          addTaskController.project = newValue!;
          addTaskController.update();
        },
        items: _taskProjectsMenuItems,
      ),
    );
  }
  //TODO añadir author
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

  Widget _buildAcceptButton(AddTaskController addTaskController) {
    return SizedBox(
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: addTaskController.submitForm,
        child: Text(
          'CREAR',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(builder: (addTaskController) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Nueva Tarea'),
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
                    //TODO acomodar en widgets independientes
                    _buildTitleTextField(addTaskController),
                    _buildDescriptionTextField(addTaskController),
                    const SizedBox(height: 25),
                    _buildTaskTypePicker(addTaskController),
                    const SizedBox(height: 20),
                    _buildDatePicker(addTaskController),
                    const SizedBox(height: 10),
                    _buildResponsableTextField(addTaskController),
                    const SizedBox(height: 20),
                    __buildProjectPicker(addTaskController),
                    const SizedBox(height: 30),
                    _buildAcceptButton(addTaskController),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
