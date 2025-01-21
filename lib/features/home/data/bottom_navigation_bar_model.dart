// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:watchlist_app/utils/enums.dart';

class BottomNavigationBarModel {
  final BottomNavItem title;
  final IconData icon;
  final IconData activeIcon;

  BottomNavigationBarModel({
    required this.title,
    required this.icon,
    required this.activeIcon,
  });
}
