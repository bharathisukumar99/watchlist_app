import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlist_app/features/watchlist/dataModel/symbol_model.dart';
import 'package:watchlist_app/features/watchlist/widgets/symbol_tile.dart';
import 'package:watchlist_app/utils/enums.dart';

class SelectedWatchListWidget extends StatelessWidget {
  const SelectedWatchListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        List<SymbolModel> data = state.watchListGroup
            .firstWhere((e) => e.groupId == state.selectedWLGroupId)
            .symbols;
        return Expanded(
          child: state.status == FetchStatus.loading
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: ReorderableListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    onReorderStart: (index) {
                      context
                          .read<WatchlistBloc>()
                          .add(ShowDragIcon(value: true));
                    },
                    onReorderEnd: (index) {
                      context
                          .read<WatchlistBloc>()
                          .add(ShowDragIcon(value: false));
                    },
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Container(
                          color: Colors.red.shade900,
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        ),
                        key: Key('${data[index].id}-$index'),
                        onDismissed: (DismissDirection direction) {
                          context
                              .read<WatchlistBloc>()
                              .add(RemoveWatchListItem(index: index));
                        },
                        child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            dense: true,
                            shape: Border(
                              bottom: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                  width: 0.2),
                            ),
                            key: Key('${data[index].id} $index'),
                            title: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: SymbolTile(data: data[index]),
                            ),
                            trailing: state.showDragIcon
                                ? Icon(Icons.drag_handle)
                                : null),
                      );
                    },
                    itemCount: data.length,
                    onReorder: (oldIndex, newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      context.read<WatchlistBloc>().add(
                          ReorderWL(oldIndex: oldIndex, newIndex: newIndex));
                    },
                    footer: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "${data.length} / 50 Stocks",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                        SizedBox(height: 30),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_note_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              "Edit Watchlist",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
