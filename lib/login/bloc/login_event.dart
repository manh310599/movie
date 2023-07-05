import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class CheckInformationLoginEvent extends LoginEvent{

  final String userName;
  final String passWord;

  CheckInformationLoginEvent(this.userName, this.passWord);

  @override
  // TODO: implement props
  List<Object?> get props => [userName,passWord];

}

class CheckPermissionLoginEvent extends LoginEvent{

  final String permission;
  CheckPermissionLoginEvent(this.permission);

  @override
  // TODO: implement props
  List<Object?> get props => [permission];

}
class CreateSessionAndLogin extends LoginEvent{
  final String token;
  final String userName;
  final String passWord;

  CreateSessionAndLogin(this.userName, this.passWord, this.token);

  @override
  // TODO: implement props
  List<Object?> get props => [token,userName,passWord];
}

