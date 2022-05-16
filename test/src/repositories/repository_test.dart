import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_app/src/models/user.dart';
import 'package:masterclass_app/src/repositories/repository.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  group('Mock Tests:', () {
    test('Deve retornar uma Lista de Users', () async {
      UserRepository repository = UserRepositoryMock();
      when(() => repository.fetchUser()).thenAnswer((_) async => listUsersMock);
      final users = await repository.fetchUser();
      expect(users, isA<List<UserModel>>());
    });

    test(
        'Deve retornar User1 para a propriedade name do primeiro elemento da lista',
        () async {
      UserRepository repository = UserRepositoryMock();
      when(() => repository.fetchUser()).thenAnswer((_) async => listUsersMock);
      final users = await repository.fetchUser();
      expect(users.first.name, 'User1');
    });
  });
}

List<UserModel> listUsersMock = [
  UserModel(
      name: 'User1',
      description: 'description1',
      socialNetWork: [],
      favoriteTechnologies: [],
      skills: []),
  UserModel(
      name: 'User2',
      description: 'description2',
      socialNetWork: [],
      favoriteTechnologies: [],
      skills: []),
  UserModel(
      name: 'User3',
      description: 'description3',
      socialNetWork: [],
      favoriteTechnologies: [],
      skills: []),
];
