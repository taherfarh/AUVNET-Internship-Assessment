part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Homeloading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Userdata> userlist;

  HomeSuccess({List<Userdata>? userlist}) : userlist = userlist ?? [];
  
}

final class HomeError extends HomeState {
  final String errormsg;

  HomeError({required this.errormsg});
}
