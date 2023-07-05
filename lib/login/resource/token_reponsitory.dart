import 'dart:convert';

import 'package:movie_app/login/resource/data_provider.dart';

import '../models/new_token.dart';

class TokenReponsitory {
  Future<NewToken> tokenReponsitory ()async {
    final data = await GetNewToken().getNewToken();
    NewToken token = NewToken.fromJson(jsonDecode(data));
    return token;
  }
}