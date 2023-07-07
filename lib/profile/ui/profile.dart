import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await  preferences.remove('session_id');
        await  preferences.remove('account_id');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(),));
      },
      child: Container(

      ),
    );
  }
}
