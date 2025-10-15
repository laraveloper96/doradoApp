// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// /// Application router configuration using GoRouter
// class AppRouter {
//   static const String home = '/';
//   static const String currencyConversion = '/currency-conversion';

//   /// GoRouter configuration
//   static final GoRouter router = GoRouter(
//     initialLocation: home,
//     routes: [
//       GoRoute(
//         path: home,
//         name: 'home',
//         builder: (context, state) => const Scaffold(
//           body: Center(
//             child: Text('Home Page - Coming Soon'),
//           ),
//         ),
//       ),
//       GoRoute(
//         path: currencyConversion,
//         name: 'currency-conversion',
//         builder: (context, state) => const Scaffold(
//           body: Center(
//             child: Text('Currency Conversion Page - Coming Soon'),
//           ),
//         ),
//       ),
//     ],
//     errorBuilder: (context, state) => Scaffold(
//       appBar: AppBar(
//         title: const Text('Error'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.red,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Page not found: ${state.uri}',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => context.go(home),
//               child: const Text('Go Home'),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
