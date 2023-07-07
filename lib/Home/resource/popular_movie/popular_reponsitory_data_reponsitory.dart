import 'dart:convert';

import 'package:movie_app/Home/resource/popular_movie/popular_movie_data_provider.dart';
import 'package:movie_app/common/models/total_pages.dart';
import 'dart:math';
import '../../models/popular_movie_model.dart';

class PopularMovieRepository {
  Future<PopularMovieModel> popularMovie () async {

    final random = Random().nextInt(500)+1;
    final popularMovieData = await PopularMovieDataProvier().popularMovie(random);
    final getPopularMovie = PopularMovieModel.fromJson(jsonDecode(popularMovieData));
    print(getPopularMovie.results);
    return getPopularMovie;
  }
}