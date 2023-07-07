

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Home/blocs/bloc/popular_movie_bloc/popular_movie.dart';
import 'package:movie_app/Home/resource/popular_movie/popular_reponsitory_data_reponsitory.dart';

import '../../../models/popular_movie_model.dart';

class PopularBloc extends Bloc<PopularMovieEvent,PopularMovieState>{
  PopularBloc():super(InitStatePopularMovie()){
    on<LoadPopularMovie>((event, emit) => getDataTopRateMovie(event, state, emit));
  }

  Future<void> getDataTopRateMovie (LoadPopularMovie event,PopularMovieState state,Emitter emit)async{
    emit(LoadingPopularMovie());
    final data = await PopularMovieRepository().popularMovie();

    final List<Results> cleanseData = [];
    //print(data.results![0].backdropPath);
    for (int i = 0;i < data.results!.length;i++){
      if (data.results![i].adult == false && data.results![i].backdropPath != null)
      {
        cleanseData.add(data.results![i]);
      }
      if (i == data.results!.length- 1){
        emit(LoadedPopularMovie(data.results!));
      }
    }

  }


}