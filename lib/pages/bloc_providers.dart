import 'package:bloc_counter/pages/Register/bloc/register_bloc.dart';
import 'package:bloc_counter/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_counter/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        // BlocProvider(lazy: false, create: (context) => AppBloc()),
        BlocProvider(create: ((context) => SignInBloc())),
        BlocProvider(create: (context) => RegisterBloc())
      ];
}
