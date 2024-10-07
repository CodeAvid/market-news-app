import 'package:fpdart/fpdart.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/network/network_exception.dart';
import 'package:market_news_app/modules/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';
import 'package:market_news_app/modules/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  DashboardRepositoryImpl(this.dashboardRemoteDataSource);

  @override
  FutureEither<List<NewsEntity>> getNews() async {
    try {
      final newsModelList = await dashboardRemoteDataSource.getNews();
      // final newsList = newsModelList.map((news) => news.toEntity()).toList();
      return Right([]);
    } on NetworkException catch (e) {
      return Left(DashboardFailure(message: e.message));
    } catch (e) {
      debugPrint('Error failing see Error: DioException s adaError: DioException : $e');
      return Left(DashboardFailure(message: 'Unable to fetch news'));
    }
  }
}
