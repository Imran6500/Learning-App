part of 'register_bloc.dart';

class RegisterStates {
  String userName;
  String email;
  String password;
  String rePassword;

  RegisterStates(
      {this.userName = "",
      this.email = "=",
      this.password = "",
      this.rePassword = ""});

  RegisterStates copyWith(
      {String? userName, String? email, String? password, String? rePassword}) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
