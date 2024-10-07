import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_news_app/app/app_bloc_provider.dart';
import 'package:market_news_app/app/app_data_sources.dart';
import 'package:market_news_app/app/app_repositories.dart';
import 'package:market_news_app/core/router/app_router.dart';
import 'package:market_news_app/core/theme/app_theme.dart';
import 'package:market_news_app/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppDataSources(
      child: AppRepositories(
        child: AppBlocProvider(
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: appRouter,
            ),
          ),
        ),
      ),
    );
  }
}
