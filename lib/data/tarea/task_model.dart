import 'package:flutter/material.dart';
import 'package:provider_counter/data/tarea/task_entitie.dart';


class TareaModel {
  int? tareaId;
  String task;
  bool completada;
  Icon categorias;
  DateTime fecha;
  DateTime hora;
  String nota;

  TareaModel({
    required this.nota,
    required this.hora,
    required this.fecha,
    required this.task,
    required this.categorias,
    this.completada = false,
    this.tareaId,
  });

  TareaEntity toEntity() {
    return TareaEntity(
      tareaId: tareaId,
      task: task,
      completada: completada,
      categorias: categorias,
      fecha: fecha,
      hora: hora,
      nota: nota,
    );
  }

  static TareaModel fromEntity(TareaEntity entity) {
    return TareaModel(
      tareaId: entity.tareaId,
      task: entity.task,
      completada: entity.completada,
      categorias: entity.categorias,
      fecha: entity.fecha,
      hora: entity.hora,
      nota: entity.nota,
    );
  }
}
