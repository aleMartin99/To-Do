// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';

String taskTypeToString(TaskType type) {
  switch (type) {
    case TaskType.onat:
      return 'Onat';
    case TaskType.inventory:
      return 'Inventario';
    case TaskType.rent:
      return 'Alquiler';
    case TaskType.productPurchase:
      return 'Compra Producto';
    case TaskType.transport:
      return 'Transporte';
    // ignore: no_default_cases
    default:
      return '';
  }
}

String taskStatusToString(
  TaskStatus status,
) {
  switch (status) {
    case TaskStatus.neW:
      return 'Nueva';
    case TaskStatus.open:
      return 'Abierta';
    case TaskStatus.inProcess:
      return 'En Proceso';
    case TaskStatus.closed:
      return 'Cerrada';
    // ignore: no_default_cases
    default:
      return '';
  }
}

String taskProjectToString(TaskProject project) {
  switch (project) {
    case TaskProject.project1:
      return 'Proyecto 1';
    case TaskProject.project2:
      return 'Proyecto 2';
    case TaskProject.project3:
      return 'Proyecto 3';
    case TaskProject.project4:
      return 'Proyecto 4';
    // ignore: no_default_cases
    default:
      return '';
  }
}

Color cardColor(TaskStatus status) {
  switch (status) {
    case TaskStatus.inProcess:
      return Colors.yellow.shade200;
    case TaskStatus.closed:
      return Colors.red.shade200;
    // ignore: no_default_cases
    default:
      return Get.theme.primaryColor.withOpacity(0.3);
  }
}
