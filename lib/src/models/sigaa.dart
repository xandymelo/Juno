class Sigaa {
  int id;
  int matricula;
  int cursoId;
  int periodo;

  Sigaa({
    required this.id,
    required this.matricula,
    required this.cursoId,
    required this.periodo,
  });

  factory Sigaa.fromJson(Map<String, dynamic> json) {
    return Sigaa(
      id: json['Id'],
      matricula: json['Matricula'],
      cursoId: json['CursoId'],
      periodo: json['Periodo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Matricula': matricula,
      'CursoId': cursoId,
      'Periodo': periodo,
    };
  }

  @override
  String toString() {
    return 'Sigaa(id: $id, Matricula: $matricula, CursoId: $cursoId, Periodo: $periodo)';
  }
}
