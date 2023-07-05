import 'package:equatable/equatable.dart';


abstract class LoginState extends Equatable{

}

class InitLoginState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTokenState extends LoginState{
  final String token;
  GetTokenState(this.token);
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}


class GetPermissionState extends LoginState{
  final String permision;
  GetPermissionState(this.permision);
  @override
  // TODO: implement props
  List<Object?> get props => [permision];

}

class NullCheck extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetTokenFail extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetPermissionFaild extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetPermissionSuccess extends GetTokenState {
  GetPermissionSuccess(String token) : super(token);

  @override
  List<Object?> get props => [super.token];
}

class LoadingLogin extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class SessionIdCode extends LoginState{
  final String? sessionID;

  SessionIdCode(this.sessionID);

  @override
  // TODO: implement props
  List<Object?> get props => [sessionID];
}