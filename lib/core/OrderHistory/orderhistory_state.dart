part of 'orderhistory_cubit.dart';

@immutable
sealed class OrderhistoryState {}

final class OrderhistoryInitial extends OrderhistoryState {}

final class Orderhistory extends OrderhistoryState {
  final List<Userdata> orders;

  Orderhistory({required this.orders});
}
