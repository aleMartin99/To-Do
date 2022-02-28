import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:gsi_test/presentation/controllers/home/home_controller.dart';
import 'package:gsi_test/utils/converters.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    Key? key,
    required this.homeController,
    required this.task,
    //required this.addTaskController
  }) : super(key: key);

  final HomeController homeController;
  // final AddTaskController addTaskController;
  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Text('Que desea hacer con la tarea?'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  widget.homeController
                      .changeStatus(widget.task, TaskStatus.inProcess);
                  Get.back();
                },
                child: Text('Procesar'),
              ),
              TextButton(
                onPressed: () {
                  widget.homeController
                      .changeStatus(widget.task, TaskStatus.closed);
                  Get.back();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Responsable: ',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(widget.task.responsable),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Estado: ',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        taskStatusToString(widget.task.status),
                      ),
                    ],
                  ),
                ],
              ),
              ButtonBar(
                children: [
                  IconButton(
                    onPressed: _showMyDialog,
                    icon: Icon(
                      Icons.more_rounded,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.homeController.deleteTask(widget.task.id!);
                    },
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
