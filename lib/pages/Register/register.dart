import 'package:bloc_counter/pages/Register/bloc/register_bloc.dart';
import 'package:bloc_counter/pages/Register/register_controller.dart';
import 'package:bloc_counter/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: reusableText(
                        "Enter your details below and free signup")),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField("Enter your user name", "user", "user",
                          (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      buildTextField("Enter your password", "password", "lock",
                          (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Re-enter password"),
                      buildTextField("Re-enter your password to confirm",
                          "rePassword", "lock", (value) {
                        context
                            .read<RegisterBloc>()
                            .add(RePasswordEvent(value));
                      }),
                      reusableText("Signup for free to learn new things"),
                      const SizedBox(
                        height: 30,
                      ),
                      buildLoginAndRegButton("Sign Up", "signup", () {
                        RegisterController(context: context)
                            .handleEmailRegister();
                      }),
                    ],
                  ),
                )
              ],
            )),
          )),
        );
      },
    );
  }
}
