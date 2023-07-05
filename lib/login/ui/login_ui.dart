import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/toast/error_toast.dart';
import 'package:movie_app/common/toast/sucesss_toast.dart';
import 'package:movie_app/common/toast/warning_toast.dart';
import 'package:movie_app/common/ui/size.dart';
import 'package:movie_app/login/bloc/login.dart';
import 'package:movie_app/login/ui/component/check_permission.dart';
import 'package:movie_app/login/ui/component/register.dart';
import 'package:movie_app/login/ui/component/reset_pass.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hint = true;
  late String? permission;
  final _user = TextEditingController();
  final _pass = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Theme(
          data: ThemeData.light(),
          child: LoginProvider(
            child: BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) => Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/back-ground.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png',
                          height: width / 3),
                      const SizedBox(
                        height: kSpacing,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: TextField(
                          controller: _user,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(kRadius))),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Nhập vào tài khoản',
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: kSpacing,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: TextField(
                          controller: _pass,
                          obscureText: hint,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(kRadius))),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Nhập vào mật khẩu',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hint == true
                                          ? hint = false
                                          : hint = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.black,
                                  ))),
                        ),
                      ),
                      const SizedBox(
                        height: kSpacing,
                      ),
                      MaterialButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                              CheckInformationLoginEvent(
                                  _user.text, _pass.text));
                        },
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kRadius)),
                        child: const Padding(
                          padding: EdgeInsets.all(kPadding),
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kSpacing,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Bạn bị quên mật khẩu? ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () async {
                                final toast = await Navigator.push<String>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ResetPass(),
                                    ));

                                ScaffoldMessenger.of(context).showSnackBar(
                                    successToast(
                                        'Kiểm tra gmail', toast.toString()));
                              },
                              child: const Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                    fontSize: 15),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              listener: (context, state)  {
                  print('state là ${state.toString()}');
                if (state is NullCheck) {
                  ScaffoldMessenger.of(context).showSnackBar(warningToast(
                      'Cảnh báo', 'Bạn phải điền đầy đủ tài khoản mật khẩu'));
                }
                else if(state is GetTokenFail)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(errorToast(
                        'Lỗi', 'Không lấy được tokent của server'));
                  }
                else if (state is GetTokenState)
                  {
                    print('token ${state.token}');
                    ScaffoldMessenger.of(context).showSnackBar(successToast(
                        'Chúc mừng', 'Lấy token thành công'));
                     Navigator.push<String>(context, MaterialPageRoute(builder: (context) => CheckPermission(token: state.token,userName: _user.text,passWord: _pass.text),));

                       //  context.read<LoginBloc>().add(CheckPermissionLoginEvent(permission!));


                  }
                else if (state is GetPermissionFaild)
                  {


                  }
                else if (state is LoadingLogin)
                {

                  print('đã load');

                }
                else if (state is SessionIdCode)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(errorToast(
                        'Lỗi', 'Ủy quyền không thành công'));
                  }
              },
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bạn chưa có tài khoản? ',
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              final toast = Navigator.push<SnackBar>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(toast as SnackBar);
            },
            child: const Text(
              'Đăng kí ngay',
              style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
