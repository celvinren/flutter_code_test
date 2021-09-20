import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dev_coding_test_calvin/app/app.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();
  await locator.allReady();

  /// Runs the app :)
  runApp(DevCodingTestCalvinApp());
}
