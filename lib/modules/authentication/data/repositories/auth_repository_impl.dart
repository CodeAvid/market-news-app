import 'package:fpdart/fpdart.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/config/params/user_params.dart';
import 'package:market_news_app/modules/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:market_news_app/modules/authentication/data/models/user_model.dart';
import 'package:market_news_app/modules/authentication/domain/entities/user_entity.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalDataSource authLocalDataSource,
    // required this.l10n,
  }) : _authLocalDataSource = authLocalDataSource;

  final AuthLocalDataSource _authLocalDataSource;
  // final AppLocalizations l10n;

  @override
  FutureEither<({bool isSignUpComplete, bool isPushNotificationActivated})> checkIfUserIsAuthenticated() async {
    try {
      final user = await _authLocalDataSource.getUser();
      final pushNotificationCompletionStatus = await _authLocalDataSource.getPushNotificationCompletionStatus();
      if (user != null) {
        return Right((isSignUpComplete: true, isPushNotificationActivated: pushNotificationCompletionStatus));
      }
      return Right((isSignUpComplete: false, isPushNotificationActivated: false));
    } catch (e) {
      return Left(AuthFailure(message: 'Error getting user'));
      // return Left(AuthFailure(message: l10n.errorGettingUser));
    }
  }

  @override
  FutureEither<UserEntity> getUser() async {
    try {
      final user = await _authLocalDataSource.getUser();
      if (user != null) {
        return Right(user.toEntity());
      }
      return Left(AuthFailure(message: 'User not found'));
      // return Left(AuthFailure(message: l10n.userNotFound));
    } catch (e) {
      return Left(AuthFailure(message: 'Error getting user'));
      // return Left(AuthFailure(message: l10n.errorGettingUser));
    }
  }

  @override
  FutureEither<bool> saveUser(UserParams user) async {
    try {
      final result = await _authLocalDataSource.saveUser(user.toModel());
      return Right(result);
    } catch (e) {
      return Left(AuthFailure(message: 'Unable to save user'));
      // return Left(AuthFailure(message: l10n.unableToSaveUser));
    }
  }

  @override
  FutureEither<bool> markEnablePushNotificationScreenAsSeen() async {
    try {
      final result = await _authLocalDataSource.markEnablePushNotificationScreenAsSeen(status: true);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure(message: 'Unable to mark notification screen as seen'));
    }
  }
}
