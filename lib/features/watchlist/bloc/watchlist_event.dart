// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'watchlist_bloc.dart';

@immutable
sealed class WatchlistEvent {}

class OnSearchSymbol extends WatchlistEvent {
  final String value;
  OnSearchSymbol({
    required this.value,
  });
}

class OnSelectionSymbol extends WatchlistEvent {
  final SymbolModel symbol;
  OnSelectionSymbol({
    required this.symbol,
  });
}

class OnSearchReset extends WatchlistEvent {}

class SelectWLGroup extends WatchlistEvent {
  final WatchListGroupModel value;
  SelectWLGroup({
    required this.value,
  });
}

class OnAddingWatchList extends WatchlistEvent {}

class RemoveWatchListItem extends WatchlistEvent {
  final int index;
  RemoveWatchListItem({
    required this.index,
  });
}

class ShowDragIcon extends WatchlistEvent {
  final bool value;
  ShowDragIcon({
    required this.value,
  });
}

class ReorderWL extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;
  ReorderWL({
    required this.oldIndex,
    required this.newIndex,
  });
}
