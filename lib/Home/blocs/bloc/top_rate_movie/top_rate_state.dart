import 'package:equatable/equatable.dart';

import '../../../models/top_rate_movie_model.dart';

abstract class TopRateMovieState extends Equatable{}

class InitState extends TopRateMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends TopRateMovieState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends TopRateMovieState{

  final List<Results>  results;

  Loaded(this.results);

  @override
  // TODO: implement props
  List<Object?> get props => [results];

}