import 'package:bloc/bloc.dart';
import 'package:masterclass_app/src/events/user_event.dart';
import 'package:masterclass_app/src/repositories/repository.dart';
import 'package:masterclass_app/src/states/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(InitialUserState()) {
    on(_fetchUsers);
  }

  Future<void> _fetchUsers(event, emit) async {
    emit(LoadingUserState());
    try {
      final users = await repository.fetchUser();
      emit(SuccessUserState(users));
    } catch (errors, stacktrace) {
      emit(ExceptionUserState(errors.toString(), stacktrace));
    }
  }
}
