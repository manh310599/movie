import 'package:equatable/equatable.dart';

abstract class UpcomingMovieEvent extends Equatable{}

class LoadMovie extends UpcomingMovieEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadingVideoUpComing extends UpcomingMovieEvent{
  final int id;

  LoadingVideoUpComing(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}