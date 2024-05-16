import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'commons/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ':upd8 teste',
      theme: customLightTheme(),
      routerConfig: Modular.routerConfig,
    );
  }
}
