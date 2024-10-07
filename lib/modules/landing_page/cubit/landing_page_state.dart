part of 'landing_page_cubit.dart';

sealed class LandingPageState extends Equatable {
  const LandingPageState();
}

final class LandingPageInitial extends LandingPageState {
  @override
  List<Object> get props => [];
}

final class NavigateToDashboard extends LandingPageState {
  @override
  List<Object> get props => [];
}

final class NavigateToSignUp extends LandingPageState {
  @override
  List<Object> get props => [];
}

final class NavigateToActivateNotification extends LandingPageState {
  @override
  List<Object> get props => [];
}
