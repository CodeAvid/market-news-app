import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';

class CheckIfUserIsAuthenticatedUseCase
    implements UseCase<({bool isSignUpComplete, bool isPushNotificationActivated}), NoParams> {
  CheckIfUserIsAuthenticatedUseCase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  FutureEither<({bool isSignUpComplete, bool isPushNotificationActivated})> call(NoParams params) async {
    return authRepository.checkIfUserIsAuthenticated();
  }
}
