import 'package:flutter_trainee_education/part11/network/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainee_education/part11/network/models/user.dart';
import 'package:flutter_trainee_education/part11/network/services/user_repository.dart';

class UserCubit extends Cubit<UserState> {

  final UsersRepository usersRepository;

  UserCubit({this.usersRepository}) :
        assert(usersRepository != null),
        super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}