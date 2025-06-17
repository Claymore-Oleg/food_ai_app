import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'src/view_models/app_view_model.dart';
import 'src/ui/screens/home_screen.dart';
import 'src/ui/screens/capture_screen.dart';
import 'src/ui/screens/result_screen.dart';
import 'src/ui/screens/history_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: '/capture',
          builder: (_, __) => const CaptureScreen(),
        ),
        GoRoute(
          path: '/result',
          builder: (_, __) => const ResultScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (_, __) => const HistoryScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Food AI',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(useMaterial3: true),
    );
  }
}