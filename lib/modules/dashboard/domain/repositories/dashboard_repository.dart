import 'package:market_news_app/core/typedefs/typedefs.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';

abstract class DashboardRepository {
  FutureEither<List<NewsEntity>> getNews();
}
