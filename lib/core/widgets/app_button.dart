import 'package:market_news_app/core/extensions/extension.dart';
import 'package:market_news_app/core/global_imports.dart';

/// A custom button widget.
///
/// A wrapper around [ElevatedButton] to provide a custom button.
///
/// If [AppButton.outlined] == true, then an OutlineButton is returned.
class AppButton extends StatelessWidget {
  /// Creates a custom button widget.
  const AppButton({
    this.text = 'Continue',
    this.onPressed,
    this.outlined = false,
    this.child,
    this.textColor,
    this.bgColor,
    this.borderSideColor,
    this.isLoading = false,
    this.textStyle,
    this.loadingIndicatorSize = 100,
    this.spaceBetweenTextAndLoadingIndicator = 10,
    this.padding,
    this.shape,
    this.width,
    this.height,
    super.key,
  });

  /// The title that appears on the button.
  ///
  /// If [child] is not null, this is ignored.
  final String text;

  /// The callback that is called when the button is tapped.
  final VoidCallback? onPressed;
  final bool outlined;
  final Widget? child;
  final Color? textColor;
  final Color? bgColor;
  final double? width;
  final double? height;

  /// This is only used when [outlined] is set to true.
  final Color? borderSideColor;

  // static const _borderRadius = BorderRadius.all(Radius.circular(5));

  /// This is used to communicate that an asynchronous task has started (set to
  /// `true`) or completed (set to `false`). Default value is `false`.
  final bool isLoading;
  final TextStyle? textStyle;
  final double loadingIndicatorSize;
  final double spaceBetweenTextAndLoadingIndicator;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 48.h,
        child: switch (outlined) {
          true => OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: padding,
                shape: shape,
                elevation: 0,
                side: borderSideColor.isNotNull
                    ? BorderSide(
                        color: borderSideColor!,
                      )
                    : null,
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: child ?? label(context),
                    ),
                  ),
                ],
              ),
            ),
          false => ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: padding,
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                backgroundColor: bgColor ?? context.primaryColor,
                disabledBackgroundColor: context.secondaryContainerColor,
                side: borderSideColor.isNotNull
                    ? BorderSide(
                        color: borderSideColor!,
                      )
                    : null,
                elevation: 0,
              ),
              onPressed: onPressed,
              child: _buildChild(context),
            ),
        },
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isLoading,
          replacement: Flexible(
            child: label(context),
          ),
          child: const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Color(0xFFE579FE),
              strokeWidth: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget label(BuildContext context) {
    return CustomAutoSizeText(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: switch (outlined) {
        false => textStyle ??
            context.textTheme.bodyMedium?.copyWith(
              color: textColor ?? Colors.white,
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
            ),
        true => textStyle ??
            context.textTheme.bodyMedium?.copyWith(
              color: textColor ?? context.primaryColor,
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
            ),
      },
    );
  }
}
