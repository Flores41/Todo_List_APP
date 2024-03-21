import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tarea_provider.dart';

class TareasCompletadas extends StatelessWidget {
  const TareasCompletadas({super.key});

  @override
  Widget build(BuildContext context) {
    final tarea = context.watch<TaskProvider>();
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
              offset: const Offset(2, 5))
        ],
      ),
      child: tarea.tareaCompletadas.isEmpty
          ? Center(
              child: Text(
                'Tareas por completar 🤨'.toUpperCase(),
                style: TextStyle(
                    color: colorScheme.primary.withOpacity(0.4),
                    fontWeight: FontWeight.w900,
                    fontSize: 13),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              itemCount: tarea.tareaCompletadas.isEmpty
                  ? 0
                  : tarea.tareaCompletadas.length * 2 - 1,
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: colorScheme.primary.withOpacity(0.4),
                      height: 5,
                    ),
                  );
                }
                final dataIndex = index ~/ 2;
                final data = tarea.tareaCompletadas[dataIndex];
                return Center(
                  child: Column(
                    children: [
                      Container(
                        width: sizeWidth,
                        height: sizeHeight * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          colorScheme.primary.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: colorScheme.primary, width: 2),
                                    ),
                                    child: Icon(
                                      data.categorias.icon,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    data.task.toUpperCase(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13,
                                        color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Checkbox(
                                    value: data.completada,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
