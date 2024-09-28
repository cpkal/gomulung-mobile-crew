part of 'app_bar_bloc.dart';

class AppBarState {
  final bool isCrewReady;

  AppBarState({required this.isCrewReady});

  AppBarState copyWith({
    bool? isCrewReady,
  }) {
    return AppBarState(
      isCrewReady: isCrewReady ?? this.isCrewReady,
    );
  }
}
