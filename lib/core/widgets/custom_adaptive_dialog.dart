import 'package:flutter/cupertino.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/utils/utils.dart';

// Function to display the adaptive dialog
void showCustomAdaptiveDialog({
  required BuildContext context,
  required String title,
  String? content,
  required String primaryButtonText,
  String? secondaryButtonText,
  required VoidCallback onPrimaryButtonPressed,
  VoidCallback? onSecondaryButtonPressed,
  bool isSecondaryDestructive = false, // New parameter for destructive action
}) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: context.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
            ),
          ),
          content: content != null
              ? Text(
                  content,
                  style: context.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                )
              : null,
          actions: [
            if (secondaryButtonText != null)
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onSecondaryButtonPressed != null) {
                    onSecondaryButtonPressed();
                  }
                },
                child: Text(
                  secondaryButtonText,
                  style: context.bodyMedium?.copyWith(
                    color: context.dialogBoxColor.primary,
                    fontSize: 17.sp,
                  ),
                ),
                isDestructiveAction: isSecondaryDestructive, // Use the new parameter
              ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                onPrimaryButtonPressed();
              },
              child: Text(
                primaryButtonText,
                style: context.bodyMedium?.copyWith(
                  color: context.dialogBoxColor.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              isDefaultAction: true,
            ),
          ],
        );
      },
    );
  } else {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: [
            if (secondaryButtonText != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onSecondaryButtonPressed != null) {
                    onSecondaryButtonPressed();
                  }
                },
                child: Text(
                  secondaryButtonText,
                  style: context.bodyMedium?.copyWith(
                    color: isSecondaryDestructive
                        ? Colors.red // Red if destructive
                        : context.dialogBoxColor.primary, // Defaul
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: context.dialogBoxColor.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onPrimaryButtonPressed();
              },
              child: Text(
                primaryButtonText,
                style: context.bodyMedium?.copyWith(
                  color: context.dialogBoxColor.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
