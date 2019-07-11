import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/authentication/authentication.dart';
import 'package:login_bloc/blocs/login/login_bloc.dart';
import 'package:login_bloc/repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
