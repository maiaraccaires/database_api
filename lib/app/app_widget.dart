import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'commons/theme.dart';
import 'services/sqflite/database.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    return FutureBuilder(
      future: _initApp(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: ':upd8 teste',
            theme: customLightTheme(),
            routerConfig: Modular.routerConfig,
            builder: FlutterSmartDialog.init(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<void> _initApp(BuildContext context) async {
    final databaseSQLFlite = Modular.get<DatabaseSQLFlite>();
    await databaseSQLFlite.database;
  }
}
