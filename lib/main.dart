import 'package:flutter/material.dart';
import 'package:watchlist_app/core/route.dart';
import 'package:watchlist_app/utils/theme.dart';
import 'package:watchlist_app/features/home/bloc/home_bloc.dart';
import 'package:watchlist_app/features/home/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => WatchlistBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: router,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
