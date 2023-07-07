import 'dart:convert';

import 'package:movie_app/Home/resource/top_rate_movie_resource/top_movie_data_provider.dart';
import 'package:movie_app/common/models/total_pages.dart';

import '../../models/top_rate_movie_model.dart';
import 'dart:math';

class TopMovieReponsitory {
  Future<TopRateMovieModels> topMovieReponsitory() async {

    final random = Random().nextInt(500) + 1;
    final topRateMovieData = await TopRateMovie().topRateMovie(random);
    final topRateMovie =
        TopRateMovieModels.fromJson(jsonDecode(topRateMovieData));
    return topRateMovie;
  }
}
