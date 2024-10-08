import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
  });
}

class DashboardFailure extends Failure {
  const DashboardFailure({
    required super.message,
  });
}
