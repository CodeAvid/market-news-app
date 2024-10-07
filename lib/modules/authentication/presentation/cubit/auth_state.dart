part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class SaveUserSuccessful extends AuthState {
  SaveUserSuccessful();

  @override
  List<Object> get props => [];
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}

final class MarkNotificationScreenAsSeenSuccessful extends AuthState {
  MarkNotificationScreenAsSeenSuccessful();

  @override
  List<Object> get props => [];
}

final class MarkNotificationScreenAsSeenError extends AuthState {
  final String message;

  MarkNotificationScreenAsSeenError(this.message);

  @override
  List<Object> get props => [message];
}
