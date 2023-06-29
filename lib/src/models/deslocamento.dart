import 'package:flutter/material.dart';

class Deslocamento {
  int id;
  int veiculoId;
  TimeOfDay horaSaida;
  int origemId;
  int destinoId;
  int status;
  int vagasDisponiveis;

  Deslocamento({
    required this.id,
    required this.veiculoId,
    required this.horaSaida,
    required this.origemId,
    required this.destinoId,
    required this.status,
    required this.vagasDisponiveis,
  });

  factory Deslocamento.fromJson(Map<String, dynamic> json) {
    return Deslocamento(
      id: json['Id'],
      veiculoId: json['VeiculoID'],
      horaSaida: json['HoraSaida'],
      origemId: json['Origemid'],
      destinoId: json['DestinoId'],
      status: json['Status'],
      vagasDisponiveis: json['VagasDisponiveis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'VeiculoID': veiculoId,
      'HoraSaida': horaSaida,
      'Origemid': origemId,
      'DestinoId': destinoId,
      'Status': status,
      'VagasDisponiveis': vagasDisponiveis,
    };
  }

  @override
  String toString() {
    return 'Deslocamento(id: $id, VeiculoID: $veiculoId, HoraSaida: $horaSaida, Origemid: $origemId, DestinoId: $destinoId, Status: $status, VagasDisponiveis: $vagasDisponiveis)';
  }
}