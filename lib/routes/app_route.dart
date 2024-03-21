import 'package:go_router/go_router.dart';
import 'package:provider_counter/screens/screens.dart';

final appRoutes = GoRouter(initialLocation: '/', routes: [

  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/Task',
    builder: (context, state) => AddTask(),
  ),
]);
