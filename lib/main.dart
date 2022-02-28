// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gsi_test/domain/service_container/service_container.dart';
import 'package:gsi_test/utils/app_colors.dart';
import 'package:gsi_test/utils/app_pages.dart';
import 'package:gsi_test/utils/app_routes.dart';

Future<void> main() async {
  ///initialices the bindings
  WidgetsFlutterBinding.ensureInitialized();

  ///locks the Orientation to portraitUp
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await registerServiceContainer().then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: AppColors.predominantColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.getInitialRoute,
      getPages: AppPages.routes,
    );
  }
}
