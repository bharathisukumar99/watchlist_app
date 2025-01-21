// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/dataModel/symbol_model.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlist_app/features/watchlist/widgets/symbol_tile.dart';

class SearchSymbolList extends StatelessWidget {
  const SearchSymbolList({
    super.key,
    required this.state,
  });
  final WatchlistState state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: state.symbolList.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        SymbolModel data = state.symbolList[index];
        return Column(
          spacing: 5,
          children: [
            CheckboxListTile(
              value: state.selectedSymbolList.any((e) => e.id == data.id),
              onChanged: (value) {
                context
                    .read<WatchlistBloc>()
                    .add(OnSelectionSymbol(symbol: data));
              },
              dense: true,
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: SymbolTile(data: data),
            ),
          ],
        );
      },
    );
  }
}
