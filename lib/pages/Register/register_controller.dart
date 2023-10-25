import 'package:bloc_counter/common/widgets/flutter_toast.dart';
import 'package:bloc_counter/pages/Register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: "Password confirmation is wrong");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been send to your registered email. To activate it click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'waek-password') {
        toastInfo(msg: "Your password is too waek");
      } else if (e.code == 'email-already in user') {
        toastInfo(msg: "Your email is already in user");
      }
    }
  }
}
