// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/utils/extensions.dart';
import 'package:watchlist_app/features/home/data/bottom_navigation_bar_model.dart';
import 'package:watchlist_app/features/home/bloc/home_bloc.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  const BottomNavigationItemWidget({super.key, required this.e});
  final BottomNavigationBarModel e;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                context.read<HomeBloc>().add(SetScreenIndex(item: e.title));
              },
              child: Column(
                spacing: 2,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(e.title == state.currentItem ? e.activeIcon : e.icon,
                      color:
                          activeColor(e.title == state.currentItem, context)),
                  FittedBox(
                    child: Text(
                      e.title.name.capitalize(),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: activeColor(
                              e.title == state.currentItem, context)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color activeColor(bool isActive, BuildContext context) => isActive
      ? Theme.of(context).primaryColor
      : Theme.of(context).colorScheme.onPrimary;
}
