import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

/// 1. ROUTER CONFIGURATION
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    // Home Screen Route
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    // Details Screen Route with Path Parameter (:id)
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        // Extract the ID from the path (e.g., "42")
        final id = state.pathParameters['id']!;
        // Extract the Filter from the query string (e.g., "?filter=popular")
        final filter = state.uri.queryParameters['filter'];

        return DetailsScreen(id: id, filter: filter);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'GoRouter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

/// 2. HOME SCREEN (From Image 1)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Navigates to /details/42 and adds a query parameter ?filter=popular
          onPressed: () => context.go('/details/42?filter=popular'),
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

/// 3. DETAILS SCREEN (From Image 2)
class DetailsScreen extends StatelessWidget {
  final String id;
  final String? filter;

  const DetailsScreen({super.key, required this.id, this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Showing product $id', style: const TextStyle(fontSize: 16)),
            if (filter != null)
              Text('Filter: $filter', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
