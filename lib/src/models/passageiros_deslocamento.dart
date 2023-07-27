class PassageirosDeslocamento {
  int? id;
  int usuarioId;
  int deslocamentoId;
  int tipo;

  PassageirosDeslocamento({
    this.id,
    required this.usuarioId,
    required this.deslocamentoId,
    required this.tipo,
  });

  factory PassageirosDeslocamento.fromJson(Map<String, dynamic> json) {
    return PassageirosDeslocamento(
      id: json['Id'],
      usuarioId: json['UsuarioID'],
      deslocamentoId: json['DeslocamentoId'],
      tipo: json['Tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UsuarioID': usuarioId,
      'DeslocamentoId': deslocamentoId,
      'Tipo': tipo,
    };
  }

  @override
  String toString() {
    return 'PassageirosDeslocamento(id: $id, UsuarioID: $usuarioId, DeslocamentoId: $deslocamentoId), Tipo: $tipo)';
  }
}
