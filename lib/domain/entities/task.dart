// ignore_for_file: public_member_api_docs

import 'package:gsi_test/data/model/task_model.dart';

class Task {
  Task({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.fulfillmentDate,
    required this.responsable,
    required this.author,
    required this.project,
    required this.status,
  });
  final int? id;
  final String title;
  final String description;
  final TaskType type;
  final DateTime fulfillmentDate;
  final String responsable;
  final String author;
  final TaskProject project;
  TaskStatus status;
}
