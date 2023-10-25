part of 'register_bloc.dart';

abstract class RegisterEvents {
  RegisterEvents();
}

class UserNameEvent extends RegisterEvents {
  final String userName;

  UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvents {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvents {
  final String password;

  PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvents {
  final String rePassword;

  RePasswordEvent(this.rePassword);
}
