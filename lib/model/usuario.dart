class Usuario {
  String? _nome;
  String? _sobrenome;
  String? _cpf;
  String? _email;
  String? _senha;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "cpf": cpf,
      "email": email,
    };
    return map;
  }

  get nome => _nome;

  set nome(value) => _nome = value;

  get sobrenome => _sobrenome;

  set sobrenome(value) => _sobrenome = value;

  get cpf => _cpf;

  set cpf(value) => _cpf = value;

  get email => _email;

  set email(value) => _email = value;

  get senha => _senha;

  set senha(value) => _senha = value;
}
