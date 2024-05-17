import '../../models/user_model.dart';

abstract class UserDBState {}

class UserInitial extends UserDBState {}

class UserLoading extends UserDBState {}

class UserInsertSuccess extends UserDBState {
  final UserModel user;

  UserInsertSuccess(this.user);
}

class UserLoginSuccess extends UserDBState {
  final UserModel user;

  UserLoginSuccess(this.user);
}

class UserFailure extends UserDBState {
  final String error;

  UserFailure(this.error);
}
