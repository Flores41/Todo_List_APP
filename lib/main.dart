
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_counter/provider/tarea_provider.dart';
import 'package:provider_counter/routes/app_route.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(primary: Colors.deepPurpleAccent),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
    
    );
  }
}
