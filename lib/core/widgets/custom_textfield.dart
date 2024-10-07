import 'package:flutter/services.dart';
import 'package:market_news_app/core/extensions/extension.dart';
import 'package:market_news_app/core/global_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.suffixIcon,
    this.rounded = false,
    this.fillColor,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.prefixIcon,
    this.noBorder = false,
    this.onTap,
    this.enabled,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.contentPadding,
    this.inputTextStyle,
    this.textFieldBoxConstraints,
    this.hintColor,
    this.borderRadius,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final Color? fillColor;
  final bool rounded;
  final bool noBorder;
  final bool obscureText;
  final bool? enabled;
  final Color? hintColor;
  final String? Function(String? input)? validator;
  final void Function(String input)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsets? contentPadding;
  final TextStyle? inputTextStyle;
  final BoxConstraints? textFieldBoxConstraints;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotNull) ...[
          Padding(
            padding: REdgeInsets.only(left: 4),
            child: CustomAutoSizeText(
              labelText!,
            ),
          ),
          VerticalSpace(8.h),
        ],
        Container(
          constraints: textFieldBoxConstraints ?? BoxConstraints(minHeight: 48.h),
          child: TextFormField(
            onTap: onTap,
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            obscureText: obscureText,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: maxLines,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            onEditingComplete: onEditingComplete,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: inputTextStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20.spMin,
                    ),
            selectionControls: MaterialTextSelectionControls(),
            decoration: InputDecoration(
              prefix: prefix,
              suffix: suffix,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: contentPadding ?? REdgeInsets.symmetric(vertical: 16, horizontal: rounded ? 20 : 12),
              fillColor: fillColor ?? context.theme.colorScheme.surface,
              filled: true,
              hintText: hintText,
              labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 20.spMin,
                  ),
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 20.spMin,
                    color: hintColor ?? context.secondaryColor.withOpacity(0.7),
                  ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
              enabledBorder: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
              focusedBorder: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
              disabledBorder: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
              errorBorder: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
              focusedErrorBorder: buildInputBorder(useRounded: rounded, noBorder: noBorder, context: context),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder buildInputBorder({
    required bool useRounded,
    required bool noBorder,
    required BuildContext context,
  }) {
    if (noBorder) {
      return OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      );
    }

    if (useRounded) {
      return OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      );
    }
    return UnderlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: context.tertiaryColor,
      ),
    );
  }
}
