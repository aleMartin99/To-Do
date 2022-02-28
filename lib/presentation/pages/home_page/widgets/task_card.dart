// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsi_test/data/model/task_model.dart';
import 'package:gsi_test/domain/entities/task.dart';
import 'package:gsi_test/presentation/controllers/home/home_controller.dart';
import 'package:gsi_test/utils/converters.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.homeController,
    required this.task,
  }) : super(key: key);

  final HomeController homeController;
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
          content: const SingleChildScrollView(
            child: Text(
              'Que desea hacer con la tarea?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
              ),
              icon: const Icon(
                Icons.auto_fix_high_rounded,
                color: Colors.black,
              ),
              label: const Text(
                'Procesarla',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {
                widget.homeController
                    .changeStatus(widget.task, TaskStatus.inProcess);
                Get.back<GetPage>();
              },
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                    MaterialStateProperty.all(Colors.red.withOpacity(0.7)),
              ),
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                widget.homeController
                    .changeStatus(widget.task, TaskStatus.closed);
                Get.back<GetPage>();
              },
              label: const Text(
                'Cerrarla',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(widget.task.status),
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
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Responsable: ',
                      style: TextStyle(color: Colors.black87),
                    ),
                    Text(widget.task.responsable),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Estado: ',
                      style: TextStyle(color: Colors.black54),
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
                  tooltip: 'Cambiar estado de la tarea',
                  icon: const Icon(
                    Icons.more_rounded,
                    color: Colors.black54,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.homeController.deleteTask(widget.task.id!);
                  },
                  tooltip: 'Eliminar Tarea',
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
