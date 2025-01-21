import 'package:flutter/material.dart';
import 'package:watchlist_app/utils/enums.dart';

import '../features/home/data/bottom_navigation_bar_model.dart';

List<BottomNavigationBarModel> bottomNavigationItems = [
  BottomNavigationBarModel(
    title: BottomNavItem.watchlist,
    icon: Icons.bookmark_outline_rounded,
    activeIcon: Icons.bookmark_rounded,
  ),
  BottomNavigationBarModel(
    title: BottomNavItem.orders,
    icon: Icons.shopping_bag_outlined,
    activeIcon: Icons.shopping_bag_rounded,
  ),
  BottomNavigationBarModel(
    title: BottomNavItem.portfolio,
    icon: Icons.business_center_outlined,
    activeIcon: Icons.business_center_rounded,
  ),
  BottomNavigationBarModel(
    title: BottomNavItem.movers,
    icon: Icons.insert_chart_outlined_rounded,
    activeIcon: Icons.insert_chart_rounded,
  ),
  BottomNavigationBarModel(
    title: BottomNavItem.more,
    icon: Icons.pending_outlined,
    activeIcon: Icons.pending_rounded,
  )
];
