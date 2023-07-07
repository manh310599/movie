import 'package:flutter/material.dart';
import 'package:movie_app/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/ui/login_ui.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Future<String?>getsession() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final session = sharedPreferences.getString('session_id');
      return session;
    }
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  Scaffold(
        body: FutureBuilder<String?>(future: getsession(),builder: (context, snapshot) {
          if (snapshot.data == null){
            return const Login();
          }
          else {
            return const BottomBar();
          }
        },),
      ),
    );
  }
}



