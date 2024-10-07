import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/config/params/user_params.dart';
import 'package:market_news_app/modules/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  FutureEither<({bool isSignUpComplete, bool isPushNotificationActivated})> checkIfUserIsAuthenticated();
  FutureEither<bool> saveUser(UserParams user);
  FutureEither<UserEntity> getUser();
  FutureEither<bool> markEnablePushNotificationScreenAsSeen();
}
