import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'upcoming.dart';

class UpComingProvider extends StatelessWidget {
  const UpComingProvider({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpComingMovieBloc>(
      create: (context) => UpComingMovieBloc(),
      child: child,
    );
  }
}
