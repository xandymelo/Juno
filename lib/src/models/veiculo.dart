class Veiculo {
  int? id;
  int usuarioId;
  int tipo;
  String placa;
  String marca;
  String modelo;
  String cor;
  int qtdPassageiros;

  Veiculo({
    this.id,
    required this.usuarioId,
    required this.tipo,
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.cor,
    required this.qtdPassageiros,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json) {
    return Veiculo(
      id: json['Id'],
      usuarioId: json['UsuarioID'],
      tipo: json['Tipo'],
      placa: json['Placa'],
      marca: json['Marca'],
      modelo: json['Modelo'],
      cor: json['Cor'],
      qtdPassageiros: json['Passageiros'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UsuarioID': usuarioId,
      'Tipo': tipo,
      'Placa': placa,
      'Marca': marca,
      'Modelo': modelo,
      'Cor': cor,
      'Passageiros': qtdPassageiros,
    };
  }

  @override
  String toString() {
    return 'Veiculo(id: $id, UsuarioID: $usuarioId, Tipo: $tipo, Placa: $placa, Marca: $marca, Modelo: $modelo, Cor: $cor, Passageiros: $qtdPassageiros)';
  }
}
