part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class loadinglogin extends AuthState {}

final class errorlogin extends AuthState {}

final class successlogin extends AuthState {}


final class loadingcreate extends AuthState {}
final class errorcreate extends AuthState {}
final class successcreate extends AuthState {}


