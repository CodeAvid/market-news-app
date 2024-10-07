part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();
}

final class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

final class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];
}

final class GetUserInfoSuccessful extends DashboardState {
  final UserEntity user;

  GetUserInfoSuccessful({required this.user});

  @override
  List<Object> get props => [user];
}

final class GetUserInfoError extends DashboardState {
  final String message;

  GetUserInfoError({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetNewsSuccessful extends DashboardState {
  final List<NewsEntity> news;

  GetNewsSuccessful({required this.news});

  @override
  List<Object> get props => [news];
}

final class GetNewsError extends DashboardState {
  final String message;

  GetNewsError({required this.message});

  @override
  List<Object> get props => [message];
}
