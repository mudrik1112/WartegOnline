import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasi_uduk/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nasi_uduk/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:nasi_uduk/screens/auth/views/welcome_screen.dart';
import 'package:nasi_uduk/screens/home/blocs/get_Warteg_bloc/get_warteg_bloc.dart';
import 'package:nasi_uduk/screens/home/views/home_screen.dart';
import 'package:warteg_repository/warteg_Repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Warteg Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.light(background: Colors.grey.shade200, onBackground: Colors.black, primary: Colors.blue, onPrimary: Colors.white)),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SignInBloc(context.read<AuthenticationBloc>().userRepository),
                  ),
                  BlocProvider(
                    create: (context) => GetWartegBloc(
                      FirebaseWartegRepo()
                    )..add(GetWarteg()),
                  ),
                ],
                child: const HomeScreen(),
              );
            } else {
              return const WelcomeScreen();
            }
          }),
        ));
  }
}