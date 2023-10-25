import 'package:bloc_counter/common/values/colors.dart';
import 'package:bloc_counter/firebase_options.dart';
import 'package:bloc_counter/pages/Register/register.dart';
import 'package:bloc_counter/pages/bloc_providers.dart';
import 'package:bloc_counter/pages/sign_in/sign_in.dart';
import 'package:bloc_counter/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme: const IconThemeData(color: AppColors.primaryText),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white, elevation: 0),
              useMaterial3: true,
            ),
            home: const Welcome(),
            routes: {
              // "myHomePage": (context) => const MyHomePage(),
              "signIn": (context) => const SignIn(),
              "register": (context) => const Register()
            },
          ),
        ));
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('MyApp'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocBuilder<AppBloc, AppStates>(
//               builder: (context, state) {
//                 return Text(
//                   "${BlocProvider.of<AppBloc>(context).state.counter}",
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: "heroTage1",
//             onPressed: () =>
//                 BlocProvider.of<AppBloc>(context).add(Increament()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: "heroTage2",
//             onPressed: () =>
//                 BlocProvider.of<AppBloc>(context).add(Decreament()),
//             tooltip: 'Decreament',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
