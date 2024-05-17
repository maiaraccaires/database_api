import '../../models/user_model.dart';

abstract class UserDBEvent {}

class InsertUserEvent extends UserDBEvent {
  final UserModel user;

  InsertUserEvent(this.user);
}

class LoginUserEvent extends UserDBEvent {
  final String email;
  final String password;

  LoginUserEvent(this.email, this.password);
}
