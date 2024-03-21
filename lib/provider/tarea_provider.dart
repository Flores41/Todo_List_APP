import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/tarea/task_entitie.dart';



class TaskProvider with ChangeNotifier {

  final List<TareaEntity> _tareas = [];
  List<TareaEntity> get tareas => _tareas;

  final List<TareaEntity> _tareaCompletadas = [];
  List<TareaEntity> get tareaCompletadas => _tareaCompletadas;

  DateTime? _seleccionarFecha = DateTime.now();
  DateTime? get seleccionarFecha => _seleccionarFecha;

  Icon _selectedCategory = const Icon(Icons.person);
  Icon get selectedCategory => _selectedCategory;
  
  bool _isSaving = false;
  bool get isSaving => _isSaving;

  void setSelectedCategory(Icon value) {
    _selectedCategory = value;
    notifyListeners();
  }

  void setIsSaving(bool value) {
    _isSaving = value;
    notifyListeners();
  }

  void agregarTarea(String tarea, DateTime fecha, String nota,Icon categoria) {

    _tareas.add(
      TareaEntity(
        categorias: selectedCategory,
        task: tarea,
        fecha: seleccionarFecha!,
        hora: seleccionarFecha!,
        nota: nota,
      ),
    );
    notifyListeners();
  }

  void completarTarea(int index) {
    _tareas[index].completada = true;
    _tareaCompletadas.add(_tareas[index]);
    _tareas.removeAt(index);
    notifyListeners();
  }

  void eliminarTarea(int index) {
    _tareas.removeAt(index);
    notifyListeners();
  }

  void updateDate(DateTime date) {
    _seleccionarFecha = DateTime(
      date.year,
      date.month,
      date.day,
      _seleccionarFecha!.hour,
      _seleccionarFecha!.minute,
    );
    notifyListeners();
  }

  void updateTime(DateTime time) {
    _seleccionarFecha = DateTime(
      _seleccionarFecha!.year,
      _seleccionarFecha!.month,
      _seleccionarFecha!.day,
      time.hour,
      time.minute,
    );
    notifyListeners();
  }
}
List<Icon> categorias = [
  const Icon(Icons.person, color: Colors.red,),
  const Icon(CupertinoIcons.sportscourt, color: Colors.lightBlueAccent,),
  const Icon(CupertinoIcons.hammer, color: Colors.green,),
];

