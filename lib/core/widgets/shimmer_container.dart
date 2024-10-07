// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:market_news_app/core/utils/utils.dart';
// 📦 Package imports:
import 'package:shimmer/shimmer.dart';
// 🌎 Project imports:

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    this.height,
    this.width,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    super.key,
  });

  final double? height;
  final double? width;
  final Color? baseColor;
  final Color? highlightColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[200]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: Container(
        height: height ?? context.screenHeight * 0.06,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: Colors.white,
        ),
      ),
    );
  }
}
