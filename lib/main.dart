import 'package:flutter/material.dart';
import 'package:juno/src/database/app_database.dart';

import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  AppInitialization.init();
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  await createDatabase();
  runApp(const MyApp());
}
