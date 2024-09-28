part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarState {
  final int currentIndex;

  BottomNavBarState({required this.currentIndex});

  BottomNavBarState copyWith({
    int? currentIndex,
  }) {
    return BottomNavBarState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
