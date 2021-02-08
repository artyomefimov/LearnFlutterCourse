import 'package:flutter_trainee_education/part11/network/models/user.dart';
import 'package:flutter_trainee_education/part11/network/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();

  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
