import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watchlist_app/features/home/presentation/home_screen.dart';
import 'package:watchlist_app/features/watchlist/presentation/search_screen.dart';
import 'package:watchlist_app/main.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
      ],
    ),
  ],
);
