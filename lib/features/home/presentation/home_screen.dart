import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/home/bloc/home_bloc.dart';
import 'package:watchlist_app/features/home/widgets/bottom_navigation_item_widget.dart';
import 'package:watchlist_app/features/more/presentation/more_screen.dart';
import 'package:watchlist_app/features/movers/presentation/movers_screen.dart';
import 'package:watchlist_app/features/orders/presentation/order_screen.dart';
import 'package:watchlist_app/features/portfolio/presentation/portfolio_screen.dart';
import 'package:watchlist_app/features/watchlist/presentation/watchlist_screen.dart';
import 'package:watchlist_app/utils/commonWidgets/header_tile.dart';
import 'package:watchlist_app/utils/constant.dart';
import 'package:watchlist_app/utils/enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.currentItem) {
            case BottomNavItem.watchlist:
              return WatchlistScreen();
            case BottomNavItem.orders:
              return OrderScreen();
            case BottomNavItem.portfolio:
              return PortfolioScreen();
            case BottomNavItem.movers:
              return MoversScreen();
            case BottomNavItem.more:
              return MoreScreen();
          }
        },
      ),
      bottomNavigationBar: ColoredBox(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: bottomNavigationItems
                .map((e) => BottomNavigationItemWidget(e: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
