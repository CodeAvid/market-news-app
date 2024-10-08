import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/router/app_routes.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/core/widgets/animated_button.dart';
import 'package:market_news_app/gen/assets.gen.dart';
import 'package:market_news_app/modules/authentication/presentation/cubit/auth_cubit.dart';

class ActivatePushNotificationScreen extends StatelessWidget {
  const ActivatePushNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Spacer(flex: 2),
              Assets.icons.chat.svg(),
              VerticalSpace(20.h),
              CustomAutoSizeText(
                'Get the most out of Blott ✅',
                style: context.bodyMedium?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalSpace(10.h),
              CustomAutoSizeText(
                'Allow notifications to stay in the loop with your payments, requests and groups.',
                style: context.bodyLarge?.copyWith(
                  color: context.secondaryColor,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 3),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  switch (state) {
                    case MarkNotificationScreenAsSeenSuccessful():
                      context.go(Routes.dashboard);
                    case MarkNotificationScreenAsSeenError(:final message):
                      context.showToast(title: message);
                    default:
                  }
                },
                builder: (context, state) {
                  return AnimatedButton(
                    isLoading: state is AuthLoading,
                    isEnable: true,
                    onPressed: () {
                      showCustomAdaptiveDialog(
                        context: context,
                        title: '“Blott” Would Like to Send You Notifications',
                        content:
                            'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
                        primaryButtonText: 'Allow',
                        secondaryButtonText: 'Don\'t Allow',
                        onPrimaryButtonPressed: () {
                          context.read<AuthCubit>().markPushNotificationScreenAsSeen();
                        },
                        onSecondaryButtonPressed: () {
                          Navigator.of(context).pop();
                          context.read<AuthCubit>().markPushNotificationScreenAsSeen();
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
