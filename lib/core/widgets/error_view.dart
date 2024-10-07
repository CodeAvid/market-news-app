import 'package:market_news_app/core/global_imports.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({
    required this.onRetry,
    required this.errorMessage,
    super.key,
  });
  final String errorMessage;

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Assets.icons.error.svg(),
        VerticalSpace(12.h),
        ReusableRichText(
          firstText: errorMessage,
          secondText: 'Try again!',
          textAction: () {},
        ),
      ],
    );
  }
}
