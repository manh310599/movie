import 'package:http/http.dart' as http;



import '../../../common/header_common.dart';

class TopRateMovie {
  Future<String> topRateMoviePageNumber ()async{
    final totalPage = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),headers: headerson);
    return totalPage.body;
  }

  Future<String> topRateMovie (int random) async {

    final topFilm = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$random'),headers: headerson);
    return topFilm.body;
  }
}