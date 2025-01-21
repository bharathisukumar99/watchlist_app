// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlist_app/features/watchlist/widgets/search_box.dart';
import 'package:watchlist_app/features/watchlist/widgets/watch_list_widget.dart';
import 'package:watchlist_app/features/watchlist/widgets/wl_group_tab.dart';
import 'package:watchlist_app/utils/commonWidgets/header_tile.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTile(
          screenName: "Watchlist",
        ),
        WLGroupTab(),
        SearchBox(
          readOnly: true,
          onTap: () {
            context.read<WatchlistBloc>().add(OnSearchReset());
            context.go('/search');
          },
        ),
        SelectedWatchListWidget()
      ],
    );
  }
}
