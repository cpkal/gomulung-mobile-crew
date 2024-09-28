part of 'app_bar_bloc.dart';

@immutable
sealed class AppBarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateAppBarEvent extends AppBarEvent {
  final bool isCrewReady;

  UpdateAppBarEvent({required this.isCrewReady});

  @override
  List<Object> get props => [isCrewReady];
}

class FetchDriverStatusEvent extends AppBarEvent {}
