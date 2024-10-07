import 'package:market_news_app/app/app.dart';
import 'package:market_news_app/app/app_manager.dart';
import 'package:market_news_app/bootstrap.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/flavor_manager.dart';

void main() async {
  FlavorManager.appFlavor = Flavor.dev;
  await AppManager.initialize();
  Bloc.observer = AppBlocObserver();
  bootstrap(() => const App());
}
