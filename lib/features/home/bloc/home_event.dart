// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class SetScreenIndex extends HomeEvent {
  final BottomNavItem item;
  SetScreenIndex({
    required this.item,
  });
}
