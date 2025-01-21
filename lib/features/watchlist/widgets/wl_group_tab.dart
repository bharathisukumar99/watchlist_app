import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_app/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlist_app/features/watchlist/dataModel/watch_list_group_model.dart';

class WLGroupTab extends StatelessWidget {
  const WLGroupTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.watchListGroup
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            context
                                .read<WatchlistBloc>()
                                .add(SelectWLGroup(value: e));
                          },
                          child: SizedBox(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 2,
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: isSelectedGroup(state, e)
                                    ? Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 3,
                                        ),
                                      )
                                    : null,
                              ),
                              child: Text(
                                e.groupname,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isSelectedGroup(state, e)
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_list_bulleted_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
        );
      },
    );
  }

  bool isSelectedGroup(WatchlistState state, WatchListGroupModel e) =>
      state.selectedWLGroupId == e.groupId;
}
