import 'package:http/http.dart' as http;
import 'package:movie_app/common/header_common.dart';

class PopularMovieDataProvier {
  Future<String> totalPage() async {
    final number = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),headers: headerson);

    return number.body;
  }

  Future<String> popularMovie (int num)async{
    final number = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?language=en-US&page=$num'),headers: headerson);
    return number.body;
  }
}