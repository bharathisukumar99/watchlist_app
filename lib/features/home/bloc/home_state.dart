// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  BottomNavItem currentItem;
  HomeState({
    this.currentItem = BottomNavItem.watchlist,
  });

  HomeState copyWith({
    BottomNavItem? currentItem,
  }) {
    return HomeState(
      currentItem: currentItem ?? this.currentItem,
    );
  }
}
