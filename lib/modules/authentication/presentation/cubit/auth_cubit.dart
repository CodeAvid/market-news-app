import 'package:equatable/equatable.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/config/params/user_params.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/mark_enable_push_notification_screen_as_seen_use_case.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/save_user_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    SaveUserUseCase saveUserUseCase,
    MarkEnablePushNotificationScreenAsSeenUseCase markEnablePushNotificationScreenAsSeenUseCase,
  )   : _saveUserUseCase = saveUserUseCase,
        _markEnablePushNotificationScreenAsSeenUseCase = markEnablePushNotificationScreenAsSeenUseCase,
        super(AuthInitial());

  final SaveUserUseCase _saveUserUseCase;
  final MarkEnablePushNotificationScreenAsSeenUseCase _markEnablePushNotificationScreenAsSeenUseCase;

  Future<void> saveUser(UserParams userParams) async {
    final result = await _saveUserUseCase(userParams);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) {
        switch (success) {
          case true:
            emit(SaveUserSuccessful());
          case false:
            emit(AuthError('Unable to save user'));
        }
      },
    );
  }

  Future<void> markPushNotificationScreenAsSeen() async {
    final result = await _markEnablePushNotificationScreenAsSeenUseCase.call(NoParams());
    result.fold(
      (failure) => emit(MarkNotificationScreenAsSeenError(failure.message)),
      (success) {
        switch (success) {
          case true:
            emit(MarkNotificationScreenAsSeenSuccessful());
          case false:
            emit(MarkNotificationScreenAsSeenError('Unable to mark notification screen as seen'));
        }
      },
    );
  }
}
