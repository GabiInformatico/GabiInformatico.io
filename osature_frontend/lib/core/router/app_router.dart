import 'package:go_router/go_router.dart';

import '../../features/adaptaciones/view/adapt_document_screen.dart';
import '../../features/landing/view/landing_screen.dart';

// Las pantallas de la app y la direccion con la que se llega a cada una.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
    GoRoute(
      path: '/adaptaciones',
      builder: (context, state) => const AdaptDocumentScreen(),
    ),
  ],
);
