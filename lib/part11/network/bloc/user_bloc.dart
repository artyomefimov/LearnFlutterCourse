import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainee_education/part11/network/bloc/user_event.dart';
import 'package:flutter_trainee_education/part11/network/bloc/user_state.dart';
import 'package:flutter_trainee_education/part11/network/models/user.dart';
import 'package:flutter_trainee_education/part11/network/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  UserBloc({this.usersRepository}) : assert(usersRepository != null);

  @override
  UserState get initialState => UserEmptyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}