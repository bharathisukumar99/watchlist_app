// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlist_app/features/watchlist/widgets/wl_add_button.dart';
import 'package:watchlist_app/features/watchlist/widgets/search_box.dart';
import 'package:watchlist_app/features/watchlist/widgets/search_symbol_list.dart';

import 'package:watchlist_app/utils/enums.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Search",
          textScaler: TextScaler.linear(1),
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [WLAddButton()],
      ),
      body: Column(
        children: [
          SearchBox(),
          Expanded(
            child: BlocConsumer<WatchlistBloc, WatchlistState>(
              listener: (context, state) {
                if (state.status == FetchStatus.success) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case FetchStatus.loading:
                    return CircularProgressIndicator();
                  default:
                    return SearchSymbolList(
                      state: state,
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
