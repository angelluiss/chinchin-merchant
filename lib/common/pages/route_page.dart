import 'package:chinchin_merchant/common/authentication/bloc/authentication_bloc.dart';
import 'package:chinchin_merchant/common/authentication/bloc/authentication_bloc.dart';
import 'package:chinchin_merchant/common/authentication/bloc/authentication_bloc.dart';
import 'package:chinchin_merchant/common/authentication/bloc/authentication_state.dart';
import 'package:chinchin_merchant/common/repository/auth_repository.dart';
import 'package:chinchin_merchant/common/repository/user_repository.dart';

import 'package:chinchin_merchant/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutePage extends StatefulWidget {
  RoutePage({Key? key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  late final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  late final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository),
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationStates>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(homeRoute, (route) => false);
                // _navigator.pushAndRemoveUntil<void>(
                //   Home(),
                //   (route) => false,
                // );
                break;
              case AuthenticationStatus.unauthenticated:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                // _navigator.pushAndRemoveUntil<void>(
                //   LoginPage(),
                //   (route) => false,
                // );
                break;

              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
