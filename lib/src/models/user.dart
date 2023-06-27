class User {
  int id;
  int sigaaId;
  int enderecoId;
  String nome;
  String sobrenome;
  String cpf;
  String senha;
  int telefone;
  String email;
  DateTime dataNascimento;

  User({
    required this.id,
    required this.sigaaId,
    required this.enderecoId,
    required this.nome,
    required this.sobrenome,
    required this.cpf,
    required this.senha,
    required this.telefone,
    required this.email,
    required this.dataNascimento,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'],
      sigaaId: json['SigaaID'],
      enderecoId: json['EndereccoID'],
      nome: json['Nome'],
      sobrenome: json['Sobrenome'],
      cpf: json['Cpf'],
      senha: json['Senha'],
      telefone: json['Telefone'],
      email: json['Email'],
      dataNascimento: DateTime.parse(json['Data de Nascimento']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SigaaID': sigaaId,
      'EndereccoID': enderecoId,
      'Nome': nome,
      'Sobrenome': sobrenome,
      'Cpf': cpf,
      'Senha': senha,
      'Telefone': telefone,
      'Email': email,
      'Data de Nascimento': dataNascimento.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'User(id: $id, SigaaID: $sigaaId, EndereccoID: $enderecoId, Nome: $nome, Sobrenome: $sobrenome, Cpf: $cpf, Senha: $senha, Telefone: $telefone, Email: $email, Data de Nascimento: $dataNascimento)';
  }
}
