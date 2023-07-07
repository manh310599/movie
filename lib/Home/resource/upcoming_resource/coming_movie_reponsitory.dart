import 'dart:convert';

import 'package:movie_app/Home/resource/upcoming_resource/data_provider.dart';

import '../../models/upcoming_movie.dart';
import '../../models/upcoming_video_model.dart';

class UpComingRepository {
  Future<UpComingMovieModel> upComingRepository()async{
    final data = await GetUpComingMovie().getUpComingMovie();
    UpComingMovieModel movie = UpComingMovieModel.fromJson(jsonDecode(data));
    return movie;
  }

  Future<UpComingVideoModel> upComingVideoRepository (int id)async{
    final data = await GetUpComingMovie().getUpComingMovieVideo(id);
    UpComingVideoModel movieVideo = UpComingVideoModel.fromJson(jsonDecode(data));
    return movieVideo;
  }
}