import 'package:market_news_app/core/typedefs/typedefs.dart';
import 'package:market_news_app/core/use_cases/no_params.dart';
import 'package:market_news_app/core/use_cases/use_case.dart';
import 'package:market_news_app/modules/authentication/domain/entities/user_entity.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';

class GetUserUseCase implements UseCase<UserEntity, NoParams> {
  GetUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  FutureEither<UserEntity> call(NoParams params) async {
    return _authRepository.getUser();
  }
}
