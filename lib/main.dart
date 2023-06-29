import 'package:finder/page/homepage.dart';
import 'package:finder/page/likedpage.dart';
import 'package:finder/page/swipe.dart';
import 'package:finder/provider/bacherlorProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BachelorProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'favorites',
          builder: (BuildContext context, GoRouterState state) {
            return const LikedPage();
          },
        ),
        GoRoute(
          path: 'swipe',
          builder: (BuildContext context, GoRouterState state) {
            return SwipePage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
