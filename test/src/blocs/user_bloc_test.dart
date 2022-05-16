import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_app/src/blocs/user_bloc.dart';
import 'package:masterclass_app/src/events/user_event.dart';
import 'package:masterclass_app/src/models/user.dart';
import 'package:masterclass_app/src/repositories/repository.dart';
import 'package:masterclass_app/src/states/user_state.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  group('Bloc Test:', (() {
    blocTest<UserBloc, UserState>(
        'Deve retornar LoadingUserState e SuccessUserState',
        build: (() {
          UserRepository repository = UserRepositoryMock();
          when(() => repository.fetchUser()).thenAnswer((_) async => [
                UserModel(
                    name: 'User1',
                    description: 'description',
                    socialNetWork: [],
                    favoriteTechnologies: [],
                    skills: [])
              ]);
          return UserBloc(repository);
        }),
        act: (bloc) => bloc.add(FetchUserEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [isA<LoadingUserState>(), isA<SuccessUserState>()]);

    blocTest<UserBloc, UserState>(
        'Deve retornar LoadingUserState e ExceptionUserState',
        build: (() {
          UserRepository repository = UserRepositoryMock();
          when(() => repository.fetchUser()).thenThrow(throwsAssertionError);
          return UserBloc(repository);
        }),
        act: (bloc) => bloc.add(FetchUserEvent()),
        wait: const Duration(seconds: 10),
        expect: () => [isA<LoadingUserState>(), isA<ExceptionUserState>()]);
  }));
}
