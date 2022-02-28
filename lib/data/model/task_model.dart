// ignore_for_file: public_member_api_docs
import 'package:gsi_test/domain/entities/task.dart';

enum TaskType { onat, inventory, rent, productPurchase, transport }

enum TaskStatus { neW, open, inProcess, closed }

enum TaskProject {
  project1,
  project2,
  project3,
  project4,
}

class TaskModel extends Task {
  TaskModel({
    final int? id,
    required String title,
    required String description,
    required TaskType type,
    required DateTime fulfillmentDate,
    required String responsable,
    required String author,
    required TaskProject project,
    required TaskStatus status,
  }) : super(
          id: id,
          title: title,
          description: description,
          type: type,
          fulfillmentDate: fulfillmentDate,
          responsable: responsable,
          author: author,
          project: project,
          status: status,
        );
}
