import 'package:flutter/material.dart';

import 'common/toast/sucesss_toast.dart';
import 'login/ui/login_ui.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Login(),
      ),
    );
  }
}



