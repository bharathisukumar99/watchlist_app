// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:watchlist_app/features/home/presentation/home_screen.dart';
import 'package:watchlist_app/features/home/widgets/custom_template.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      screenName: 'Orders',
    );
  }
}
