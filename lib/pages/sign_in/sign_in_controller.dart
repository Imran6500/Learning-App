// ignore_for_file: avoid_print

import 'package:bloc_counter/common/widgets/flutter_toast.dart';
import 'package:bloc_counter/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need fill email address");
          return;
        }

        if (password.isEmpty) {
          toastInfo(msg: "You need fill password ");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email address");
            return;
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            print("user exist");
          } else {
            //got error
            toastInfo(msg: "currently you are not the user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
            print('Please provide correct credential');
            toastInfo(msg: "Please provide correct credential");
          }
          if (e.code == 'user-not-found') {
            print('no user found for this email');
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            print('wrong password provided');
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            print('your email formate is not correct');
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
