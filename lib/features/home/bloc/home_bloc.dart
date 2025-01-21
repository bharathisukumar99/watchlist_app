import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watchlist_app/utils/enums.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SetScreenIndex>((event, emit) {
      emit(state.copyWith(currentItem: event.item));
    });
  }
}
