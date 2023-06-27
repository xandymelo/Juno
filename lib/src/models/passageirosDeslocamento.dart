class PassageirosDeslocamento {
  int id;
  int usuarioId;
  int deslocamentoId;

  PassageirosDeslocamento({
    required this.id,
    required this.usuarioId,
    required this.deslocamentoId,
  });

  factory PassageirosDeslocamento.fromJson(Map<String, dynamic> json) {
    return PassageirosDeslocamento(
      id: json['Id'],
      usuarioId: json['UsuarioID'],
      deslocamentoId: json['DeslocamentoId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UsuarioID': usuarioId,
      'DeslocamentoId': deslocamentoId,
    };
  }

  @override
  String toString() {
    return 'PassageirosDeslocamento(id: $id, UsuarioID: $usuarioId, DeslocamentoId: $deslocamentoId)';
  }
}
