import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/presentation/controllers/add_task/add_task_controller.dart';

class AddTaskPage extends GetView<AddTaskController> {
  AddTaskPage({Key? key}) : super(key: key);

  Future<void> _selectDate(BuildContext context, AddTaskController _) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _.fulfillmentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != _.fulfillmentDate) {
      _.fulfillmentDate = picked;
      _.update();
    }
  }

  final List<DropdownMenuItem<TaskType>> _taskTypesMenuItems = TaskType.values
      .map((type) => DropdownMenuItem<TaskType>(
            value: type,
            child: Text('taskTypeToString(type)'),
          ))
      .toList();

  final List<DropdownMenuItem<TaskProject>> _taskProjectsMenuItems =
      TaskProject.values
          .map((project) => DropdownMenuItem<TaskProject>(
                value: project,
                child: Text('taskTProjectToString(project)'),
              ))
          .toList();

  Widget _buildTitleTextField(AddTaskController _) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'I18nKeys.title.tr',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (String? value) => _.title = value!,
    );
  }

  Widget _buildDescriptionTextField(AddTaskController _) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'I18nKeys.description.tr',
      ),
      maxLines: 3,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //  validator: AppValidator.validateRequired,
      onSaved: (String? value) => _.description = value!,
    );
  }

  Widget _buildTaskTypePicker(AddTaskController _) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        '${'I18nKeys.taskType.tr'}:',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        iconEnabledColor: Get.theme.primaryColor,
        value: _.type,
        onChanged: (TaskType? newValue) {
          _.type = newValue!;
          _.update();
        },
        items: _taskTypesMenuItems,
      ),
    );
  }

  Widget _buildDatePicker(AddTaskController _) {
    return ListTile(
      selectedTileColor: Get.theme.primaryColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        '${'I18nKeys.finalizationDate.tr'}:',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${_.fulfillmentDate.toLocal()}".split(' ')[0],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Get.theme.primaryColor,
            ),
            onPressed: () {
              _selectDate(Get.context!, _);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeadTextField(AddTaskController _) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Responsable',
      ),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: AppValidator.validateRequired,
      onSaved: (String? value) => _.responsable = value!,
    );
  }

  Widget __buildProjectPicker(AddTaskController _) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Tipo',
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: DropdownButton(
        iconEnabledColor: Get.theme.primaryColor,
        value: _.project,
        onChanged: (TaskProject? newValue) {
          _.project = newValue!;
          _.update();
        },
        items: _taskProjectsMenuItems,
      ),
    );
  }
  // Widget _buildProjectTextField(AddTaskController _) {
  //   return TextFormField(
  //     textCapitalization: TextCapitalization.sentences,
  //     decoration: InputDecoration(
  //       labelText: '.project.tr',
  //     ),
  //     textInputAction: TextInputAction.done,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     // validator: AppValidator.validateRequired,
  //     onSaved: (String? value) => _.project = value!,
  //   );
  // }

  Widget _buildAcceptButton(AddTaskController _) {
    return SizedBox(
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: _.submitForm,
        child: Text(
          'CREAR',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Tarea'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _.formKey,
              child: Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    //TODO acomodar en widgets independientes
                    _buildTitleTextField(_),
                    _buildDescriptionTextField(_),
                    const SizedBox(height: 25),
                    _buildTaskTypePicker(_),
                    const SizedBox(height: 20),
                    _buildDatePicker(_),
                    const SizedBox(height: 10),
                    _buildHeadTextField(_),
                    const SizedBox(height: 20),
                    __buildProjectPicker(_),
                    const SizedBox(height: 30),
                    _buildAcceptButton(_),
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
