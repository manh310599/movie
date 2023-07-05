import 'package:movie_app/common/header_common.dart';
import 'package:http/http.dart'as http;
class GetNewToken {
  Future<String> getNewToken() async {
    final token = await http.get(Uri.parse('https://api.themoviedb.org/3/authentication/token/new'),headers: header);
    return token.body;
  }
}