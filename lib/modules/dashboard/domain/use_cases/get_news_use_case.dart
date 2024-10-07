import 'package:market_news_app/core/typedefs/typedefs.dart';
import 'package:market_news_app/core/use_cases/no_params.dart';
import 'package:market_news_app/core/use_cases/use_case.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';
import 'package:market_news_app/modules/dashboard/domain/repositories/dashboard_repository.dart';

class GetNewsUseCase implements UseCase<List<NewsEntity>, NoParams> {
  GetNewsUseCase({
    required DashboardRepository dashboardRepository,
  }) : _dashboardRepository = dashboardRepository;

  final DashboardRepository _dashboardRepository;

  @override
  FutureEither<List<NewsEntity>> call(NoParams params) async {
    return _dashboardRepository.getNews();
  }
}
