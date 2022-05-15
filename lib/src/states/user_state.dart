import 'package:masterclass_app/src/models/user.dart';

abstract class UserState {}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {
  final List<UserModel> userModel;

  SuccessUserState(this.userModel);
}

class ExceptionUserState extends UserState {
  final String errorMessage;
  final StackTrace? stackTrace;

  ExceptionUserState(this.errorMessage, [this.stackTrace]);
}
