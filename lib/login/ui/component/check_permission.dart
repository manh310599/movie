import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_app/common/toast/error_toast.dart';
import 'package:movie_app/common/toast/sucesss_toast.dart';
import 'package:movie_app/login/bloc/login.dart';
import 'package:movie_app/login/bloc/login.dart';

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
    return LoginProvider(
      child: BlocBuilder<LoginBloc, LoginState>(
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
                    ScaffoldMessenger.of(context).showSnackBar(successToast('Thành công', 'Đã được ủy quyền'));
                    Navigator.popUntil(context, (route) => route.isFirst);
                    // Navigator.pop(context, 'allow');
                  } else if (_url ==
                      'https://www.themoviedb.org/authenticate/${widget.token}/deny') {

                    //ScaffoldMessenger.of(context).showSnackBar(errorToast('Thất bại', 'Ủy quyền thất bại'));

                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
