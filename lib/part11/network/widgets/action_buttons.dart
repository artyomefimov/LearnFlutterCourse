import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainee_education/part11/network/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUsers();
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
          },
          color: Colors.red,
        ),
      ],
    );
  }
}