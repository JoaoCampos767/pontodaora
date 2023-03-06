import 'package:flutter/material.dart';
import 'package:pontodaora/views/register.dart';
import 'package:pontodaora/views/home.dart';
import 'package:pontodaora/views/login.dart';

class RouteGeneretor {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final parametros = settings.arguments;

    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => const Home());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const Login());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => const Register());
    }
    return null;
  }
}
