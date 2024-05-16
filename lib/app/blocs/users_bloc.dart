import 'package:bloc/bloc.dart';
import 'package:upd8_teste/app/blocs/users_event.dart';
import 'package:upd8_teste/app/blocs/users_state.dart';

import '../services/api_service.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final APIService service;
  UsersBloc(this.service) : super(UsersLoaded([])) {
    on<FetchUsersEvent>(_getUsers);
  }

  void _getUsers(FetchUsersEvent event, Emitter<UsersState> emit) async {
    emit(LoadingUsers());
    try {
      final users = await service.getUserByEmail();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError('Não há Usuários'));
    }
  }
}
