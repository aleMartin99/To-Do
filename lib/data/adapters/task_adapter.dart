import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:hive/hive.dart';

part 'task_adapter.g.dart';

@HiveType(typeId: 1)
class TaskAdapt extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final int type;

  @HiveField(3)
  final int status;

  @HiveField(4)
  final DateTime fulfillmentDate;

  @HiveField(5)
  final String responsable;

  @HiveField(6)
  final String author;

  @HiveField(7)
  final int project;

  TaskAdapt({
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.fulfillmentDate,
    required this.responsable,
    required this.author,
    required this.project,
  });

  factory TaskAdapt.fromDomain(Task response) {
    return TaskAdapt(
      title: response.title,
      description: response.description,
      type: response.type.index,
      status: response.status.index,
      fulfillmentDate: response.fulfillmentDate,
      responsable: response.responsable,
      author: response.author,
      project: response.project.index,
    );
  }

  Task toDomain() {
    return Task(
      id: key as int,
      title: title,
      description: description,
      type: TaskType.values[type],
      status: TaskStatus.values[status],
      fulfillmentDate: fulfillmentDate,
      responsable: responsable,
      author: author,
      project: TaskProject.values[project],
    );
  }
}
