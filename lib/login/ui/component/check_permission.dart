import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart'as http;
import 'package:movie_app/common/header_common.dart';
import 'package:movie_app/common/key.dart';
import 'package:movie_app/common/models/account_id.dart';
import 'package:movie_app/common/toast/sucesss_toast.dart';
import 'package:movie_app/login/bloc/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class CheckPermission extends StatefulWidget {
  const CheckPermission(
      {Key? key,
      required this.token,
      required this.userName,
      required this.passWord})
      : super(key: key);
  final String? token;
  final String? userName;
  final String? passWord;

  @override
  State<CheckPermission> createState() => _CheckPermissionState();
}

class _CheckPermissionState extends State<CheckPermission> {
  InAppWebViewController? _webViewController;
  String? _url;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoadingLogin) {
          print('đã load');
        } else if (state is SessionIdCode) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
           await preferences.setString('session_id', state.sessionID!);
          final sessionID =  preferences.get('session_id');
          final data = await http.get(Uri.parse('https://api.themoviedb.org/3/account?session_id=$sessionID&api_key=$apiKeyAuth'),headers: header);
          final accountID = AccountID.fromJson(jsonDecode(data.body));
          await preferences.setInt('account_id', accountID.id!);
          if (preferences.getInt('account_id')!=null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyApp(),));
          }

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                  'https://www.themoviedb.org/authenticate/${widget.token}'),
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) async {
              setState(() {
                _url = url.toString();
              });
            },
            onLoadStop: (controller, url) async {
              if (_url !=
                      'https://www.themoviedb.org/authenticate/${widget.token}' &&
                  _url != 'https://www.themoviedb.org/login') {
                if (_url ==
                    'https://www.themoviedb.org/authenticate/${widget.token}/allow') {
                  context.read<LoginBloc>().add(CreateSessionAndLogin(
                      widget.userName!, widget.passWord!, widget.token!));
                  print(context.read<LoginBloc>().isClosed.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                      successToast('Thành công', 'Đã được ủy quyền'));
                  // Navigator.pop(context);

                  // Navigator.pop(context, 'allow');
                } else if (_url ==
                    'https://www.themoviedb.org/authenticate/${widget.token}/deny') {
                  //ScaffoldMessenger.of(context).showSnackBar(errorToast('Thất bại', 'Ủy quyền thất bại'));

                  // Navigator.pop(context);
                }
              }
            },
          ),
        );
      },
    );
  }
}
