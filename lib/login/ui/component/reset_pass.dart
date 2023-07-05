import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_app/common/toast/sucesss_toast.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  InAppWebViewController? _controller;
   String _url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://www.themoviedb.org/reset-password')),
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onLoadStart: (controller, url)  {
          setState(() {
            _url =  url.toString();
          });
          if (_url == 'https://www.themoviedb.org/login') {
            _controller?.goBack();

            Navigator.pop(context,'Mật khẩu đã được gửi đến gmail của bạn');
          }

        },
      ),
    );
  }
}
