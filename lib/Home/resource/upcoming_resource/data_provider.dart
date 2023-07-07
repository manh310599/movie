import 'package:http/http.dart'as http;
import 'dart:math';

import 'package:movie_app/common/header_common.dart';
class GetUpComingMovie {
  Future<String> getUpComingMovie () async {
    var random = Random().nextInt(10)+1;

    final film = await  http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=$random'),headers: headerson);

    return film.body;
  }

  Future<String> getUpComingMovieVideo (int id) async {
      final video =  await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id/videos?language=en-US'),headers: headerson);
      return video.body;
  }

}