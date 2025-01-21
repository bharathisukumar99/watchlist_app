import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:watchlist_app/features/watchlist/dataModel/symbol_model.dart';
import 'package:watchlist_app/features/watchlist/dataModel/watch_list_group_model.dart';
import 'package:watchlist_app/utils/enums.dart';
import 'package:watchlist_app/utils/mock_data.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc()
      : super(WatchlistState(
          symbolList: List.generate(
            10,
            (index) => mockSymbols[index],
          ),
          symbolListCopy: mockSymbols,
          selectedSymbolList: [],
          selectedWLGroupId: groups.first.groupId,
          watchListGroup: groups,
        )) {
    on<OnSelectionSymbol>((event, emit) {
      emit(state.copyWith(
          selectedSymbolList:
              state.selectedSymbolList.any((e) => e.id == event.symbol.id)
                  ? (state.selectedSymbolList..remove(event.symbol))
                  : (state.selectedSymbolList..add(event.symbol))));
    });
    on<OnSearchSymbol>((event, emit) {
      if (event.value.trim().isNotEmpty) {
        emit(state.copyWith(symbolList: [
          ...state.symbolListCopy.where((e) =>
              e.name.toLowerCase().startsWith(event.value.toLowerCase()) &&
              !state.selectedSymbolList.any((es) => es.id == e.id)),
          ...state.selectedSymbolList
        ]));
      } else {
        emit(state.copyWith(symbolList: state.symbolListCopy));
      }
      emit(state.copyWith(status: FetchStatus.initial));
    });
    on<OnSearchReset>((event, emit) {
      emit(state.copyWith(
        selectedSymbolList: [],
        symbolList: List.generate(
          10,
          (index) => mockSymbols[index],
        ),
      ));
    });

    on<SelectWLGroup>((event, emit) {
      emit(state.copyWith(selectedWLGroupId: event.value.groupId));
    });
    on<OnAddingWatchList>((event, emit) {
      emit(state.copyWith(status: FetchStatus.loading));
      try {
        int index = state.watchListGroup
            .indexWhere((e) => e.groupId == state.selectedWLGroupId);
        List<SymbolModel> symbols = (state.watchListGroup[index].symbols
              ..addAll(state.selectedSymbolList))
            .toSet()
            .toList();
        emit(state.copyWith(
            watchListGroup: state.watchListGroup..[index].symbols = symbols));
        emit(state.copyWith(status: FetchStatus.success));
      } on Exception catch (e) {
        emit(state.copyWith(status: FetchStatus.failure));
      }
      emit(state.copyWith(status: FetchStatus.initial));
    });
    on<ShowDragIcon>((event, emit) {
      emit(state.copyWith(showDragIcon: event.value));
    });
    on<RemoveWatchListItem>((event, emit) {
      emit(state.copyWith(status: FetchStatus.loading));

      try {
        int index = state.watchListGroup
            .indexWhere((e) => e.groupId == state.selectedWLGroupId);
        state.watchListGroup[index].symbols.removeAt(event.index);
        emit(state.copyWith(watchListGroup: state.watchListGroup));
      } on Exception catch (e) {}
      emit(state.copyWith(status: FetchStatus.initial));
    });
    on<ReorderWL>((event, emit) {
      emit(state.copyWith(status: FetchStatus.loading));

      try {
        int index = state.watchListGroup
            .indexWhere((e) => e.groupId == state.selectedWLGroupId);
        SymbolModel removedWL =
            state.watchListGroup[index].symbols.removeAt(event.oldIndex);
        state.watchListGroup[index].symbols.insert(event.newIndex, removedWL);
        emit(state.copyWith(watchListGroup: state.watchListGroup));
      } on Exception catch (e) {}
      emit(state.copyWith(status: FetchStatus.initial));
    });
  }
}
