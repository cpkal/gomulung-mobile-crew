import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarState(currentIndex: 0)) {
    on<UpdateBottomNavBarEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
