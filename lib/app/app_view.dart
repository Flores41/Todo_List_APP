// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:provider_counter/screens/screens.dart';

// import '../provider/auth_provider.dart';

// class MyAppView extends StatelessWidget {
//   const MyAppView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Pizza App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.light(
//             background: Colors.grey.shade200,
//             onBackground: Colors.black,
//             primary: Colors.deepPurpleAccent,
//             onPrimary: Colors.white),
//       ),
//       home: ChangeNotifierProvider(
//   create: (_) => UserAuthProvider(),
//   child: Consumer<UserAuthProvider>(
//     builder: (context, user, _) {
//       switch (user.status) {
//         case UserStatus.uninitialized:
//           return const WelcomeScreen();
//         case UserStatus.loading:
//           return const CircularProgressIndicator();
//         case UserStatus.success:
//           return const HomeScreen();
//         case UserStatus.failure:
//           // Aquí manejas el estado de error mostrando una alerta
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Error'),
//                 content: const Text('Ha ocurrido un error en la autenticación.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           });
//           return const SizedBox(); // No devuelvas nada aquí porque estás mostrando un diálogo
//         default:
//           // Este es un caso de fallback por si se agrega un nuevo estado en el futuro
//           return const CircularProgressIndicator();
//       }
//     },
//   ),
// ),

//     );
//   }
// }
