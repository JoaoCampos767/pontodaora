import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pontodaora/model/usuario.dart';

import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  String _mensagemErro = "";

  _logar() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    Usuario usuario = Usuario();
    usuario.email = email;
    usuario.senha = senha;

    _logarUsuario(usuario);
  }

  _logarUsuario(Usuario usuario) async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
    }).catchError((error) {
      setState(() {
        _mensagemErro = "Erro ao tentar logar";
      });
    });
  }

  _verificaUsuarioLogado() {
    FirebaseAuth auth = FirebaseAuth.instance;

    User usuarioLogado = auth.currentUser!;

    if (usuarioLogado != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formLogin = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formLogin,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 35),
                    child: TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo Email é obrigatório";
                        }

                        if (!value.contains("@")) {
                          return "Email é necessário conter @";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: TextFormField(
                      controller: _controllerSenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo Senha é obrigatório";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 100, right: 100),
                    child: ElevatedButton(
                      onPressed: () {
                        final isValid = formLogin.currentState?.validate();

                        if (isValid!) {
                          print("Validou corretamente...");

                          _logar();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 140, 0, 255),
                        padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      ),
                      child: const Text(
                        "Logar",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/cadastro");
                      },
                      child: const Text(
                        "Clique aqui para se Cadastrar!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
