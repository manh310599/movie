import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_app/common/toast/sucesss_toast.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  InAppWebViewController? _webViewController;
  String _url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://www.themoviedb.org/signup'),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          setState(() {
            _url = url.toString();
          });

          if (_url != 'https://www.themoviedb.org/signup') {

            _webViewController?.goBack();


            Navigator.pop(context,successToast('Đăng kí thành công', 'Hãy kiểm tra gmail của bạn'));
          }
        },
      )
    );
  }
}
