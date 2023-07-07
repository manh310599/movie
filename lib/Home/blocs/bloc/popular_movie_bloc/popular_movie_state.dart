

import 'package:equatable/equatable.dart';

import '../../../models/popular_movie_model.dart';

abstract class PopularMovieState extends Equatable{}

class InitStatePopularMovie extends PopularMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingPopularMovie extends PopularMovieState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedPopularMovie extends PopularMovieState{

  final List<Results>  results;

  LoadedPopularMovie(this.results);

  @override
  // TODO: implement props
  List<Object?> get props => [results];

}