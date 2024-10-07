import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:market_news_app/core/utils/utils.dart';

class ReusableRichText extends StatelessWidget {
  const ReusableRichText({
    required this.firstText,
    required this.secondText,
    super.key,
    this.textAction,
  });
  final String firstText;
  final String secondText;
  final VoidCallback? textAction;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: context.bodyMedium,
          ),
          TextSpan(
            text: secondText,
            style: context.bodyMedium?.copyWith(
              color: context.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = textAction,
          ),
        ],
      ),
    );
  }
}
