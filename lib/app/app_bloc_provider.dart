import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_news_app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/check_if_user_is_authenticated_use_case.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/mark_enable_push_notification_screen_as_seen_use_case.dart';
import 'package:market_news_app/modules/authentication/domain/use_cases/save_user_use_case.dart';
import 'package:market_news_app/modules/authentication/presentation/cubit/auth_cubit.dart';
import 'package:market_news_app/modules/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:market_news_app/modules/dashboard/domain/use_cases/get_news_use_case.dart';
import 'package:market_news_app/modules/dashboard/domain/use_cases/get_user_use_case.dart';
import 'package:market_news_app/modules/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:market_news_app/modules/landing_page/cubit/landing_page_cubit.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingPageCubit>(
          create: (context) => LandingPageCubit(
            CheckIfUserIsAuthenticatedUseCase(
              authRepository: context.read<AuthRepository>(),
            ),
          )..checkIfUserIsAuthenticated(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            SaveUserUseCase(
              authRepository: context.read<AuthRepository>(),
            ),
            MarkEnablePushNotificationScreenAsSeenUseCase(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(
            GetUserUseCase(
              authRepository: context.read<AuthRepository>(),
            ),
            GetNewsUseCase(
              dashboardRepository: context.read<DashboardRepository>(),
            ),
          )..getUserInfo(),
        ),
      ],
      child: _child,
    );
  }
}
