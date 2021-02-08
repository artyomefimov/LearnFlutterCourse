import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainee_education/part11/network/cubit/user_cubit.dart';
import 'package:flutter_trainee_education/part11/network/services/user_repository.dart';
import 'package:flutter_trainee_education/part11/network/widgets/action_buttons.dart';
import 'package:flutter_trainee_education/part11/network/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
