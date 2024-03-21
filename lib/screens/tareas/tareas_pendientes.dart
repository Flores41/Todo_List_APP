import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/tarea_provider.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final task = context.watch<TaskProvider>();
    final colorScheme = Theme.of(context).colorScheme;
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width:sizeWidth,
      height: sizeWidth / 1.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.15),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Center(
        child: task.tareas.isEmpty
            ? Center(
                child: Text(
                  'Sin tareas....'.toUpperCase(),
                  style: TextStyle(
                      color: colorScheme.primary.withOpacity(0.4),
                      fontWeight: FontWeight.w800,
                      fontSize: 13),
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                itemCount: task.tareas.length,
                itemBuilder: (context, index) {
                  final data = task.tareas[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Eliminar Tarea".toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                content: Text(
                                  "¿Estás seguro de que deseas eliminar esta tarea?"
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      task.eliminarTarea(index);
                                      context.pop();
                                    },
                                    child: const Text("Eliminar"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width:sizeWidth,
                          height: sizeHeight * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        // Icono de la categoria
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: data.categorias.color!
                                                  .withOpacity(0.4),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: data.categorias.color!,
                                                  width: 2)),
                                          // Icono de la tarea
                                          child: Icon(
                                            data.categorias.icon,
                                            color: data.categorias.color,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Nombre de la tarea
                                            Text(
                                              data.task.toUpperCase(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                // Fecha de la tarea
                                                Text(
                                                  '${data.fecha.day}/${data.fecha.month}/${data.fecha.year}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 12,
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                                const SizedBox(width: 10),
                                                // Hora de la tarea
                                                Text(
                                                  '${data.hora.hour}:${data.hora.minute}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 12,
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                              ],
                                            ),
                                            // Nota de la tarea
                                            Text(data.nota.toUpperCase(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 11,
                                                    color:
                                                        Colors.grey.shade600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: data.completada,
                                          onChanged: (value) {
                                            task.completarTarea(index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      index != task.tareas.length - 1
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                                height: 5,
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
