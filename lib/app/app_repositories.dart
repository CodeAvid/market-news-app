import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/modules/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:market_news_app/modules/authentication/data/repositories/auth_repository_impl.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:market_news_app/modules/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:market_news_app/modules/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:market_news_app/modules/dashboard/domain/repositories/dashboard_repository.dart';

class AppRepositories extends StatelessWidget {
  const AppRepositories({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            authLocalDataSource: context.read<AuthLocalDataSource>(),
            // l10n: AppLocalizations.of(context),
          ),
        ),
        RepositoryProvider<DashboardRepository>(
          create: (context) => DashboardRepositoryImpl(
            context.read<DashboardRemoteDataSource>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
