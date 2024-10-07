import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/flavor_manager.dart';
import 'package:market_news_app/modules/dashboard/data/models/response/news_model.dart';

abstract class DashboardRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final NetworkClient networkClient;

  DashboardRemoteDataSourceImpl(this.networkClient);

  @override
  Future<List<NewsModel>> getNews() async {
    final response = await networkClient.get(
      'https://finnhub.io/api/v1/news',
      queryParameters: {
        'category': 'general',
        'token': FlavorManager.token,
      },
    );

    return [];
  }
}
