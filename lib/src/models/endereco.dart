class Endereco {
  int id;
  String municipio;
  String bairro;
  String rua;
  int numero;
  String complemento;

  Endereco({
    required this.id,
    required this.municipio,
    required this.bairro,
    required this.rua,
    required this.numero,
    required this.complemento,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      municipio: json['Municipio'],
      bairro: json['Bairro'],
      rua: json['Rua'],
      numero: json['Numero'],
      complemento: json['Complemento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Municipio': municipio,
      'Bairro': bairro,
      'Rua': rua,
      'Numero': numero,
      'Complemento': complemento,
    };
  }

  @override
  String toString() {
    return 'Endereco(id: $id, Municipio: $municipio, Bairro: $bairro, Rua: $rua, Numero: $numero, Complemento: $complemento)';
  }
}
