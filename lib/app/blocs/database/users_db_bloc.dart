import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../services/database/user_database.dart';

import 'users_db.state.dart';
import 'users_db_event.dart';

class UserDBBloc extends Bloc<UserDBEvent, UserDBState> {
  final DatabaseSQLFlite databaseSQLFlite;

  UserDBBloc(this.databaseSQLFlite) : super(UserInitial()) {
    on<InsertUserEvent>(_insertUser);
    on<LoginUserEvent>(_loginUser);
  }

  Future<void> _insertUser(
      InsertUserEvent event, Emitter<UserDBState> emit) async {
    emit(UserLoading());
    SmartDialog.showLoading(msg: 'Aguarde...');
    await Future.delayed(const Duration(seconds: 2));
    try {
      databaseSQLFlite.insertUser(event.user);

      emit(UserInsertSuccess(event.user));
      await _loginUser(
          LoginUserEvent(event.user.email, event.user.password), emit);
    } catch (e) {
      emit(UserFailure(e.toString()));
      SmartDialog.showToast(
          'Erro ao criar cadastro. Tente novamente mais tarde.',
          displayTime: const Duration(seconds: 3));
    }
  }

  Future<void> _loginUser(
      LoginUserEvent event, Emitter<UserDBState> emit) async {
    emit(UserLoading());
    SmartDialog.showLoading(msg: 'Aguarde...');
    await Future.delayed(const Duration(seconds: 2));
    try {
      final user = await databaseSQLFlite.login(event.email, event.password);

      if (user != null) {
        emit(UserLoginSuccess(user));
        SmartDialog.dismiss();
        Modular.to.pushNamed('/home');
      } else {
        emit(UserFailure("Login failed. User not found."));
        SmartDialog.dismiss();
        SmartDialog.showToast('E-mail ou senha inválida. Tente novamente.',
            displayTime: const Duration(seconds: 3));
      }
    } catch (e) {
      emit(UserFailure(e.toString()));
      SmartDialog.dismiss();
      SmartDialog.showToast('Erro ao tentar logar. Tente novamente mais tarde.',
          displayTime: const Duration(seconds: 3));
    }
  }

  @override
  Future<void> close() {
    databaseSQLFlite.closeDatabase();
    return super.close();
  }
}
