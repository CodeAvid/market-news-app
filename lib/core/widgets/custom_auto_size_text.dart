import 'package:auto_size_text/auto_size_text.dart';
import 'package:market_news_app/core/global_imports.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText(
    String this.data, {
    super.key,
    this.textKey,
    this.style,
    this.strutStyle,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.group,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  });

  final Key? textKey;
  final String? data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final List<double>? presetFontSizes;
  final AutoSizeGroup? group;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool wrapWords;
  final TextOverflow? overflow;
  final Widget? overflowReplacement;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      data!,
      style: style,
      textAlign: textAlign,
      group: group,
      locale: locale,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      minFontSize: minFontSize,
      overflow: overflow,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      stepGranularity: stepGranularity,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textKey: textKey,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
    );
  }
}

class CustomAutoSizeTextRich extends StatelessWidget {
  const CustomAutoSizeTextRich(
    TextSpan this.textSpan, {
    super.key,
    this.textKey,
    this.style,
    this.strutStyle,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.group,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  });

  final Key? textKey;
  final TextSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final List<double>? presetFontSizes;
  final AutoSizeGroup? group;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool wrapWords;
  final TextOverflow? overflow;
  final Widget? overflowReplacement;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      textSpan!,
      style: style,
      textAlign: textAlign,
      group: group,
      locale: locale,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      minFontSize: minFontSize,
      overflow: overflow,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      stepGranularity: stepGranularity,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textKey: textKey,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
    );
  }
}
