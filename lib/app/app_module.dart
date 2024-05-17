import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upd8_teste/app/blocs/users/users_bloc.dart';
import 'package:upd8_teste/app/pages/home.dart';
import 'package:upd8_teste/app/pages/login.dart';
import 'package:upd8_teste/app/pages/profile.dart';
import 'package:upd8_teste/app/pages/register.dart';
import 'package:upd8_teste/app/services/database/user_database.dart';

import 'blocs/database/users_db_bloc.dart';
import 'services/api/api_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<DatabaseSQLFlite>(() => DatabaseSQLFlite());
    i.addSingleton<APIService>(() => APIService(i.get<Dio>()));
    i.addLazySingleton<UsersBloc>(() => UsersBloc(i.get<APIService>()));
    i.addLazySingleton<UserDBBloc>(() => UserDBBloc(i.get<DatabaseSQLFlite>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
    r.child('/home', child: (context) => const HomePage());
    r.child('/profile', child: (context) => const ProfilePage());
  }
}
