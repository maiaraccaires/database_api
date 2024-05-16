import 'package:upd8_teste/app/models/user_model.dart';

abstract class UsersState {}

class LoadingUsers implements UsersState {}

class UsersLoaded implements UsersState {
  final List<UserModel> data;
  UsersLoaded(this.data);
}

class UsersError implements UsersState {
  final String message;
  UsersError(this.message);
}
