import 'package:flutter/material.dart';
import 'package:movie_app/router.dart';
import 'package:movie_app/theme/theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
