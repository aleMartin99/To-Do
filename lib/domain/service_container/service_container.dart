import 'package:get/get.dart';
import 'package:gsi_test/data/datasources/task_local_data_source.dart';
import 'package:gsi_test/data/local_db/cache_manager.dart';
import 'package:gsi_test/data/repositories/task_repository.dart';
import 'package:gsi_test/domain/repositories/i_task_repository.dart';

T sl<T>() => Get.find<T>();

Future<void> registerServiceContainer() async {
  await Get.putAsync<CacheManager>(() => CacheManager().init());

  Get.put<ITaskLocalDataSource>(
    TaskLocalDataSource(cacheManager: sl<CacheManager>()),
    permanent: true,
  );

  Get.put<ITaskRepository>(
    TaskRepository(local: sl<ITaskLocalDataSource>()),
    permanent: true,
  );
}
