import 'package:masterclass_app/src/models/user.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchUser();
}
