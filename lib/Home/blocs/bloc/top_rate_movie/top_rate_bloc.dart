import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Home/blocs/bloc/top_rate_movie/top_rate.dart';
import 'package:movie_app/Home/models/top_rate_movie_model.dart';

import '../../../resource/top_rate_movie_resource/top_data_movie_responsitory.dart';

class TopRateMovieBloc extends Bloc<TopRateMovieEvent,TopRateMovieState>{
  TopRateMovieBloc():super(InitState()){
    on<LoadMovieTopRateMovie>((event, emit) => getDataTopRateMovie(event, state, emit));
  }

  Future<void> getDataTopRateMovie (LoadMovieTopRateMovie event,TopRateMovieState state,Emitter emit)async{
    emit(Loading());
   final data = await TopMovieReponsitory().topMovieReponsitory();

   final List<Results> cleanseData = [];
   for (int i = 0;i < data.results!.length;i++){
     if (data.results![i].adult == false && data.results![i].backdropPath != null)
       {
         cleanseData.add(data.results![i]);
       }
     if (i == data.results!.length- 1){
       emit(Loaded(data.results!));
     }
   }

  }

}