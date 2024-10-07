import 'package:dio/dio.dart';
import 'package:market_news_app/app/app_local_storage.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/provider/custom_datasource_provider.dart';
import 'package:market_news_app/core/provider/custom_multi_datasource_provider.dart';
import 'package:market_news_app/core/storage/shared_preference_service.dart';
import 'package:market_news_app/modules/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:market_news_app/modules/dashboard/data/data_sources/dashboard_remote_data_source.dart';

class AppDataSources extends StatelessWidget {
  const AppDataSources({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return MultiDataSourceProvider(
      providers: [
        DataSourceProvider<NetworkClient>(
          create: (context) => NetworkClient(
            dio: Dio(),
          ),
        ),
        DataSourceProvider<AppLocalStorage>(
          create: (context) => SharedPreferenceService(),
        ),
        DataSourceProvider<AuthLocalDataSource>(
          create: (context) => AuthLocalDataSourceImpl(
            appLocalStorage: context.read<AppLocalStorage>(),
          ),
        ),
        DataSourceProvider<DashboardRemoteDataSource>(
          create: (context) => DashboardRemoteDataSourceImpl(
            context.read<NetworkClient>(),
          ),
        ),
      ],
      child: _child,
    );
  }
}
