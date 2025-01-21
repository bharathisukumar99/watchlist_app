// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';
import 'package:flutter/material.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({
    super.key,
    required this.screenName,
  });
  final String screenName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            screenName,
            textScaler: TextScaler.linear(2),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Transform.rotate(
            angle: pi / 12,
            child: Icon(
              Icons.push_pin_outlined,
              color: Theme.of(context).hintColor,
            ),
          )
        ],
      ),
    );
  }
}
