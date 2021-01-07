part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignedIn extends AuthState {
  final User user;

  AuthSignedIn(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}
