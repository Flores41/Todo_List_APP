import 'package:flutter/material.dart';

class TareaEntity {
  int? tareaId;
  String task;
  bool completada;
  Icon categorias;
  DateTime fecha;
  DateTime hora;
  String nota;

  TareaEntity({
    required this.nota,
    required this.hora,
    required this.fecha,
    required this.task,
    required this.categorias,
    this.completada = false,
    this.tareaId,
  });

  Map<String, dynamic> toJson() {
    return {
      'tareaId': tareaId,
      'task': task,
      'completada': completada,
      'categorias': categorias,
      'fecha': fecha,
      'hora': hora,
      'nota': nota,
    };
  }

  factory TareaEntity.fromJson(Map<String, dynamic> json) {
    return TareaEntity(
      tareaId: json['tareaId'],
      task: json['task'],
      completada: json['completada'],
      categorias: json['categorias'],
      fecha: json['fecha'],
      hora: json['hora'],
      nota: json['nota'],
    );
  }
}
