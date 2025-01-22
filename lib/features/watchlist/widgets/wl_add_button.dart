// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';

class WLAddButton extends StatelessWidget {
  const WLAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
          child: FilledButton(
            onPressed: () {
              if (state.watchListGroup
                          .firstWhere(
                              (e) => e.groupId == state.selectedWLGroupId)
                          .symbols
                          .length +
                      state.selectedSymbolList.length >
                  50) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Maximum Watchlist Limit"),
                  behavior: SnackBarBehavior.floating,
                ));
              } else {
                context.read<WatchlistBloc>().add(OnAddingWatchList());
              }
            },
            style: FilledButton.styleFrom(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text("Add"),
          ),
        );
      },
    );
  }
}
