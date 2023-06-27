class Curso {
  int id;
  String nome;
  int turno;

  Curso({
    required this.id,
    required this.nome,
    required this.turno,
  });

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['Id'],
      nome: json['Nome'],
      turno: json['Turno'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Nome': nome,
      'Turno': turno,
    };
  }

  @override
  String toString() {
    return 'Curso(id: $id, Nome: $nome, Turno: $turno)';
  }
}
