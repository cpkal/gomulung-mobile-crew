import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(AppBarState(isCrewReady: false)) {
    on<FetchDriverStatusEvent>(_onFetchDriverStatusEvent);
    on<AppBarEvent>((event, emit) {
      if (event is UpdateAppBarEvent) {
        emit(state.copyWith(isCrewReady: event.isCrewReady));
      }
    });
  }

  Future _onFetchDriverStatusEvent(
    FetchDriverStatusEvent? event,
    Emitter<AppBarState> emit,
  ) async {
    // final isCrewReady = await _driverRepository.isCrewReady();
    final isCrewReady = true;
    emit(state.copyWith(isCrewReady: isCrewReady));
  }
}
