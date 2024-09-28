part of 'bottom_nav_bar_bloc.dart';

@immutable
sealed class BottomNavBarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateBottomNavBarEvent extends BottomNavBarEvent {
  final int index;

  UpdateBottomNavBarEvent({required this.index});

  @override
  List<Object> get props => [index];
}
