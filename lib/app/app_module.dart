import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upd8_teste/app/blocs/users_bloc.dart';
import 'package:upd8_teste/app/pages/home.dart';
import 'package:upd8_teste/app/pages/login.dart';
import 'package:upd8_teste/app/pages/profile.dart';
import 'package:upd8_teste/app/pages/register.dart';

import 'services/api_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<APIService>(() => APIService(i.get<Dio>()));
    i.addLazySingleton<UsersBloc>(() => UsersBloc(i.get<APIService>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
    r.child('/home', child: (context) => const HomePage());
    r.child('/profile', child: (context) => const ProfilePage());
  }
}
