import 'package:flutter/material.dart';
import 'package:watchlist_app/utils/commonWidgets/header_tile.dart';

class CustomTemplate extends StatelessWidget {
  final String screenName;
  const CustomTemplate({
    super.key,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTile(screenName: screenName),
        Expanded(
            child: Center(
          child: Text("Coming soon"),
        ))
      ],
    );
  }
}
