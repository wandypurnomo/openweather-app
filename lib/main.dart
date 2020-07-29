import 'package:flutter/material.dart';
import 'package:openweather/injector.dart';
import 'package:openweather/presentation/root_screen.dart';
import 'package:logging/logging.dart';

void main() {
  Injector.serviceLocator();
  setupLogging();
  runApp(RootScreen());
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
