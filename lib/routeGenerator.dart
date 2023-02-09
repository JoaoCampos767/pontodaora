import 'package:flutter/material.dart';
import 'package:pontodaora_old/telas/cadastro.dart';
import 'package:pontodaora_old/telas/home.dart';
import 'package:pontodaora_old/telas/login.dart';

class RouteGeneretor {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case "/cadastro":
        return MaterialPageRoute(
          builder: (_) => const Cadastro(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
        defautl:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tela não encontrada!"),
          ),
          body: const Center(
            child: Text("Tela não encontrada!"),
          ),
        );
      },
    );
  }
}
