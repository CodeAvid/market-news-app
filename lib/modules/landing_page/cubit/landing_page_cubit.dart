import 'package:equatable/equatable.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/check_if_user_is_authenticated_use_case.dart';

part 'landing_page_state.dart';

class LandingPageCubit extends Cubit<LandingPageState> {
  LandingPageCubit(this.checkIfUserIsAuthenticatedUseCase) : super(LandingPageInitial());
  final CheckIfUserIsAuthenticatedUseCase checkIfUserIsAuthenticatedUseCase;

  Future<void> checkIfUserIsAuthenticated() async {
    final result = await checkIfUserIsAuthenticatedUseCase(const NoParams());
    result.fold(
      (failure) => emit(NavigateToSignUp()),
      (userStatus) {
        switch ((userStatus.isSignUpComplete, userStatus.isPushNotificationActivated)) {
          case (true, true):
            emit(NavigateToDashboard());
          case (true, false):
            emit(NavigateToActivateNotification());
          default:
            emit(NavigateToSignUp());
        }
      },
    );
  }
}
