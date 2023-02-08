import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerSobreNome = TextEditingController();
  final TextEditingController _controllerCPF = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final formCadastro = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        backgroundColor: const Color.fromARGB(255, 140, 0, 255),
      ),
      body: Form(
        key: formCadastro,
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
                    padding: const EdgeInsets.only(
                      bottom: 35,
                      left: 30,
                      right: 30,
                    ),
                    child: TextFormField(
                      controller: _controllerNome,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo Nome é obrigatório!";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 30, right: 30),
                    child: TextFormField(
                      controller: _controllerSobreNome,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        hintText: "Sobrenome",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo Nome é obrigatório!";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 30, right: 30),
                    child: TextFormField(
                      controller: _controllerCPF,
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskCpf],
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        hintText: "CPF",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo CPF é obrigatório";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 30, right: 30),
                    child: TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 17),
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
                        const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                    child: TextFormField(
                      obscureText: true,
                      controller: _controllerSenha,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo Senha é obrigatório";
                        }

                        if (value.length <= 6) {
                          return "Senha deve conter mais de 6 caracteres";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 10, left: 100, right: 100),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 140, 0, 255),
                        padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      ),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
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
