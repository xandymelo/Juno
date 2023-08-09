class User {
  int id;
  int sigaaId;
  int enderecoId;
  String nome;
  String sobrenome;
  String cpf;
  String senha;
  String telefone;
  String email;
  String? dataNascimento;
  String imageUrl;
  final bool hasAccount;

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
    required this.imageUrl,
    this.dataNascimento,
    this.hasAccount = false
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
      dataNascimento: json['Data de Nascimento'],
      imageUrl: json['ImageUrl'],
      hasAccount: json['HasAccount'] ?? false,
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
      'DataDeNascimento': dataNascimento,
      'HasAccount': hasAccount,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, SigaaID: $sigaaId, EndereccoID: $enderecoId, Nome: $nome, Sobrenome: $sobrenome, Cpf: $cpf, Senha: $senha, Telefone: $telefone, Email: $email, Data de Nascimento: $dataNascimento, HasAccount: $hasAccount)';
  }
}
