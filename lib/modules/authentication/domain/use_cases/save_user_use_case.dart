import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/config/params/user_params.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';

class SaveUserUseCase implements UseCase<bool, UserParams> {
  SaveUserUseCase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  FutureEither<bool> call(UserParams params) async {
    return authRepository.saveUser(params);
  }
}
