import 'package:market_news_app/app/app.dart';
import 'package:market_news_app/app/app_manager.dart';
import 'package:market_news_app/bootstrap.dart';
import 'package:market_news_app/flavor_manager.dart';

void main() {
  FlavorManager.appFlavor = Flavor.staging;
  AppManager.initialize();
  bootstrap(() => const App());
}
