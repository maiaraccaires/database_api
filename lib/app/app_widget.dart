import 'package:flutter/material.dart';

import 'commons/theme.dart';
import 'pages/login.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ':upd8 teste',
      theme: customLightTheme(),
      home: const LoginPage(),
    );
  }
}
