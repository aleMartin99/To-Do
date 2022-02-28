// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';
import 'package:gsi_test/data/adapters/task_adapter.dart';
import 'package:gsi_test/data/local_db/const.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class CacheManager extends GetxService {
  late Box _tasksBox;

  Future<CacheManager> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(TaskAdaptAdapter());

    _tasksBox = await Hive.openBox<dynamic>(CacheBoxes.tasksBox);

    return this;
  }

  Box _getBox(String boxName) {
    switch (boxName) {
      case CacheBoxes.tasksBox:
        return _tasksBox;
      default:
        return _tasksBox;
    }
  }

  Future<List<T>> getAll<T>(String boxName) async {
    final box = _getBox(boxName);
    final boxList = <T>[];
    final length = box.length;

    for (var i = 0; i < length; i++) {
      boxList.add(box.getAt(i) as T);
    }
    return boxList;
  }

  Future<int> add<T>(T item, String boxName) async {
    final box = _getBox(boxName);
    final response = await box.add(item);
    return response;
  }

  Future<void> delete<T>(int key, String boxName) async {
    final box = _getBox(boxName);
    await box.delete(key);
  }

  Future<void> changeStatus<T>(String boxName, TaskAdapt task, int id) async {
    final box = _getBox(boxName);
    await box.put(id, task);
  }

  @override
  Future<void> onClose() async {
    for (final item in CacheBoxes.allBoxes) {
      if (Hive.isBoxOpen(item)) {
        await Hive.box<dynamic>(item).compact();
      }
    }
    await Hive.close();
    super.onClose();
  }
}
