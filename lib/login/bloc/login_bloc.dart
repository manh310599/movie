import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/header_common.dart';
import 'package:movie_app/login/bloc/login_event.dart';
import 'package:movie_app/login/bloc/login_state.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/login/models/new_session.dart';
import 'package:movie_app/login/resource/token_reponsitory.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(InitLoginState()){
    on<CheckInformationLoginEvent>((event, emit) => getToken(event, state, emit));
    on<CheckPermissionLoginEvent>((event, emit) => checkPermission(event, state, emit));
    on<CreateSessionAndLogin>((event, emit) => createSessionLogin(event, state));
  }

  String? tokendata;

  Future<void> getToken (LoginEvent event,LoginState state,Emitter emit) async {
    if (event is CheckInformationLoginEvent && event.passWord.isNotEmpty && event.userName.isNotEmpty)
      {
        final token = await TokenReponsitory().tokenReponsitory();
        if (token.requestToken!.isNotEmpty)
          {
            tokendata = token.requestToken!;
            emit (GetTokenState(token.requestToken!));
          }
        else {
          emit (GetTokenFail());
          emit(InitLoginState());
        }
      }
    else {
      emit(NullCheck());
      emit(InitLoginState());
    }
  }
  Future<void> checkPermission (CheckPermissionLoginEvent event,LoginState state,Emitter emit)async{
    if (event.permission == 'deny'){
      emit(GetPermissionFaild());
    }
    else if (event.permission == 'allow'){
      emit(GetPermissionSuccess(tokendata!));
    }
  }

  Future<void> createSessionLogin (CreateSessionAndLogin event,LoginState state)async{
    final body = jsonEncode(<String,String>{
      "username": event.userName,
      "password": event.passWord,
      "request_token": event.token
    });
    final test = await http.post(Uri.parse('https://api.themoviedb.org/3/authentication/token/validate_with_login'),headers: header,body: body);
    if(test.statusCode == 200){

      emit(LoadingLogin());
      final sesion = await http.post(Uri.parse('https://api.themoviedb.org/3/authentication/session/new'),headers: header,body: jsonEncode(<String,String>{'request_token':event.token}));
      final sessionCode  = Session.fromJson(jsonDecode(sesion.body));

      emit(SessionIdCode(sessionCode.sessionId));
    }
    else{
      print('thất bại');
    }
  }
}