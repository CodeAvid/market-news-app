import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';

class MarkEnablePushNotificationScreenAsSeenUseCase implements UseCase<bool, NoParams> {
  MarkEnablePushNotificationScreenAsSeenUseCase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  FutureEither<bool> call(NoParams params) async {
    return authRepository.markEnablePushNotificationScreenAsSeen();
  }
}
