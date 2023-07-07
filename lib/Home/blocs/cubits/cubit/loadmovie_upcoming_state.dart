import 'package:equatable/equatable.dart';

import '../../../models/upcoming_video_model.dart';

abstract class UpComingMovieStateCubit extends Equatable{}



class LoadingUpComingVideo extends UpComingMovieStateCubit{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadedUpComingVideo extends UpComingMovieStateCubit{

  final List<ResultsVideo> results;

  LoadedUpComingVideo(this.results);

  @override
  // TODO: implement props
  List<Object?> get props => [results];
}
class LoadFailUpComingVideo extends UpComingMovieStateCubit{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}