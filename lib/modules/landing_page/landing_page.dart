import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/router/app_routes.dart';
import 'package:market_news_app/modules/landing_page/cubit/landing_page_cubit.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingPageCubit, LandingPageState>(
      listener: (context, state) {
        switch (state) {
          case NavigateToDashboard():
            context.go(Routes.dashboard);
            break;
          case NavigateToActivateNotification():
            context.go(Routes.activateNotification);
          default:
            GoRouter.of(context).go(Routes.signUp);
        }
      },
      child: Scaffold(),
    );
  }
}
