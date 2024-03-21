import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider_counter/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    String formattedDate = DateFormat('MMMM dd, yyyy', 'es').format(now);
    final colorScheme = Theme.of(context).colorScheme;
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: sizeHeight,
              width: sizeWidth,
              color: colorScheme.primary.withOpacity(0.1),
            ),
            Container(
              height: sizeHeight * 0.28,
              decoration: BoxDecoration(
                color: colorScheme.secondary.withOpacity(0.9),
              ),
            ),
            Container(
              height: sizeHeight * 0.12,
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.8),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 120.0, sigmaY: 100.0),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Center(
                      child: Text(
                        formattedDate.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Center(
                      child: Text(
                        'Lista de tareas'.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Task(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Tareas Completadas'.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TareasCompletadas(),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    hoverColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    onTap: () {
                      context.push('/task');
                    },
                    child: Center(
                      child: Material(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: sizeWidth * 0.8,
                          height: sizeHeight * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Agregar Nueva Tarea'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
