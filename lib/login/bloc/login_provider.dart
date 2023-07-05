import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: child,
    );
  }
}
