// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'watchlist_bloc.dart';

class WatchlistState {
  List<SymbolModel> symbolList;
  List<SymbolModel> symbolListCopy;
  List<SymbolModel> selectedSymbolList;
  List<WatchListGroupModel> watchListGroup;
  String selectedWLGroupId;
  FetchStatus status;
  FetchStatus submitStatus;
  bool showDragIcon;
  WatchlistState({
    this.symbolList = const [],
    this.symbolListCopy = const [],
    required this.selectedSymbolList,
    required this.watchListGroup,
    this.selectedWLGroupId = '',
    this.status = FetchStatus.initial,
    this.submitStatus = FetchStatus.initial,
    this.showDragIcon = false,
  });

  WatchlistState copyWith({
    List<SymbolModel>? symbolList,
    List<SymbolModel>? symbolListCopy,
    List<SymbolModel>? selectedSymbolList,
    List<WatchListGroupModel>? watchListGroup,
    String? selectedWLGroupId,
    FetchStatus? status,
    FetchStatus? submitStatus,
    bool? showDragIcon,
  }) {
    return WatchlistState(
      symbolList: symbolList ?? this.symbolList,
      symbolListCopy: symbolListCopy ?? this.symbolListCopy,
      selectedSymbolList: selectedSymbolList ?? this.selectedSymbolList,
      watchListGroup: watchListGroup ?? this.watchListGroup,
      selectedWLGroupId: selectedWLGroupId ?? this.selectedWLGroupId,
      status: status ?? this.status,
      submitStatus: submitStatus ?? this.submitStatus,
      showDragIcon: showDragIcon ?? this.showDragIcon,
    );
  }
}
