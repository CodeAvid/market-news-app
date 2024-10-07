import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/core/widgets/layout.dart';

enum ToastPosition {
  top,
  center,
  bottom,
}

enum ToastType {
  info,
  success,
  error,
}

extension ToastExtension on BuildContext {
  void showToast({
    ToastType type = ToastType.error,
    required String title,
    Color? textColor,
    Color? backgroundColor,
    int toastDurationInSeconds = 3,
    double? height,
    double? topPadding,
    ToastPosition position = ToastPosition.top,
  }) {
    final FToast fToast = FToast();
    fToast
      ..init(this)
      ..showToast(
        child: ToastContainerBuilder(
          onTap: fToast.removeCustomToast,
          toastType: type,
          title: title,
          textColor: textColor,
          backgroundColor: backgroundColor,
          height: height,
          topPadding: topPadding,
        ),
        positionedToastBuilder: (context, child) {
          switch (position) {
            case ToastPosition.top:
              return Positioned(
                top: topPadding ?? 60,
                left: 24,
                right: 24,
                child: child,
              );
            case ToastPosition.center:
              return Positioned(
                top: screenHeight * 0.5,
                left: 24,
                right: 24,
                child: child,
              );
            case ToastPosition.bottom:
              return Positioned(
                bottom: screenHeight * 0.1,
                left: 24,
                right: 24,
                child: child,
              );
          }
        },
        toastDuration: Duration(seconds: toastDurationInSeconds),
      );
  }
}

class ToastContainerBuilder extends StatelessWidget {
  const ToastContainerBuilder({
    required this.toastType,
    required this.title,
    required this.onTap,
    this.textColor,
    this.backgroundColor,
    this.height,
    this.topPadding,
    super.key,
  });

  final VoidCallback onTap;
  final ToastType toastType;
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    switch (toastType) {
      case ToastType.info:
        return ToastTypeContainer(
          height: height,
          icon: Icon(
            Icons.info,
            color: Colors.blue.shade700,
          ),
          backgroundColor: Colors.blue.shade50,
          accentColor: Colors.blue.shade700,
          title: title,
          onTap: onTap,
          topPadding: topPadding,
        );
      case ToastType.success:
        return ToastTypeContainer(
          height: height,
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          backgroundColor: Colors.green.shade50,
          accentColor: Colors.green,
          title: title,
          onTap: onTap,
          topPadding: topPadding,
        );
      case ToastType.error:
        return ToastTypeContainer(
          height: height,
          icon: const Icon(
            Icons.info,
            color: Colors.red,
          ),
          backgroundColor: Colors.red.shade50,
          accentColor: context.theme.colorScheme.error,
          title: title,
          onTap: onTap,
          topPadding: topPadding,
        );
    }
  }
}

class ToastTypeContainer extends StatelessWidget {
  const ToastTypeContainer({
    required this.height,
    required this.backgroundColor,
    required this.accentColor,
    required this.title,
    required this.onTap,
    required this.icon,
    this.topPadding,
    this.dismissible = true,
    super.key,
  });

  final bool dismissible;
  final Widget icon;
  final double? topPadding;
  final double? height;
  final Color? backgroundColor;
  final Color? accentColor;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 16, right: 20, top: 10, bottom: 10),
      width: 0.85.sw,
      height: height ?? 0.07.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: backgroundColor ?? const Color(0xffFCEEEE),
      ),
      child: SizedBox(
        width: 0.55.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  HorizontalSpace(10.w),
                  Expanded(
                    child: Text(
                      title,
                      style: context.bodyMedium?.copyWith(
                        color: accentColor,
                        fontSize: 14.spMin,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (dismissible)
              InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Container(
                      width: 1.h,
                      height: double.infinity,
                      color: accentColor,
                    ),
                    const SizedBox(width: 16),
                    // Assets.icons.close.svg(
                    //   colorFilter: ColorFilter.mode(
                    //     accentColor ?? context.theme.colorScheme.error,
                    //     BlendMode.srcIn,
                    //   ),
                    // ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
