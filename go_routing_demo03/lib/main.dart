import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

// 1. Router configuration with names assigned to each route
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home', // The unique name for the root route
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details', // The unique name for the details route
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Named Routes',
      routerConfig: _router, // Connects the GoRouter to the App [cite: 58, 61]
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // 2. Navigation using the NAME instead of the PATH
          onPressed: () => context.goNamed('details'),
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('This is the details screen!')),
    );
  }
}
