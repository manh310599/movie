import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Home/blocs/bloc/upcoming_bloc/upcoming_event.dart';
import 'package:movie_app/Home/blocs/bloc/upcoming_bloc/upcoming_state.dart';
import 'package:movie_app/Home/models/upcoming_movie.dart';

import '../../../resource/upcoming_resource/coming_movie_reponsitory.dart';

class UpComingMovieBloc extends Bloc<UpcomingMovieEvent, UpComingMovieState> {
  UpComingMovieBloc() : super(InitState()) {
    on<LoadMovie>((event, emit) => loadUpComingMovie(event, state, emit));

  }

  Future<void> loadUpComingMovie(
      LoadMovie event, UpComingMovieState state, Emitter emit) async {
    emit(LoadingMovie());
    final movie = await UpComingRepository().upComingRepository();

    int tam = 0;
    final List<Results> data = [];
    for (int i = 0; i < movie.results!.length; i++) {

      if (movie.results![i].adult == false && movie.results![i].backdropPath != null) {
        data.add(movie.results![i]);
        tam++;
      }
      if (tam == 5) {
        emit(LoadMovieSuccess(data));
        break;
      }
    }
  }


}
