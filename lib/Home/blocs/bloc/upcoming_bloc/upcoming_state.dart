import 'package:equatable/equatable.dart';

import '../../../models/upcoming_movie.dart';
import '../../../models/upcoming_video_model.dart';

abstract class UpComingMovieState extends Equatable {}

class InitState extends UpComingMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingMovie extends UpComingMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadMovieSuccess extends UpComingMovieState{

  final List<Results> upComing;

  LoadMovieSuccess(this.upComing);
  @override
  // TODO: implement props
  List<Object?> get props => [upComing];
}

class LoadingUpComingVideo extends UpComingMovieState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

