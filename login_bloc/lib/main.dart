import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:login_bloc/blocs/authentication/bloc.dart';
import 'package:login_bloc/pages/home_page.dart';
import 'package:login_bloc/pages/login_page.dart';
import 'package:login_bloc/pages/splash_page.dart';
import 'package:login_bloc/repository/user_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(BlocProvider(
    builder: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }

          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }

          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }

          return SplashPage();
        },
      ),
    );
  }
}
