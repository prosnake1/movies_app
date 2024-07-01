import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/pages/collection_page/collection_page.dart';
import 'package:movie_app/pages/film_page/film_page.dart';
import 'package:movie_app/pages/home_page/home_page.dart';
import 'package:movie_app/pages/login_page/login_page.dart';
import 'package:movie_app/pages/search_page/search_page.dart';
import 'package:movie_app/pages/sign_up_page/sign_up_page.dart';
import 'package:movie_app/repositories/di/di_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

GoRouter router = GoRouter(
  initialLocation: (FirebaseAuth.instance.currentUser == null) ? '/login' : '/',
  observers: [TalkerRouteObserver(talker)],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: '/film/:id',
      builder: (context, state) {
        final id = state.extra as int?;
        return FilmPage(
          id: id ?? 0,
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/collection',
      builder: (context, state) => const CollectionPage(),
    )
  ],
);
