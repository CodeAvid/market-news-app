// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:market_news_app/core/utils/utils.dart';
// import 'package:market_news_app/core/widgets/widgets.dart';
// import 'package:market_news_app/l10n/l10n.dart';
//
// class ReusableTextField extends HookWidget {
//   const ReusableTextField({
//     required this.hintText,
//     required this.labelText,
//     this.onChanged,
//     this.textInputType,
//     this.validator,
//     this.hideLabelText = false,
//     this.onSubmit,
//     this.enabled = true,
//     super.key,
//   });
//   final bool hideLabelText;
//   final void Function(String)? onSubmit;
//   final String hintText;
//   final TextInputType? textInputType;
//   final String? labelText;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String?>? onChanged;
//   final bool enabled;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = useTextEditingController();
//     return AppReusableTextField(
//       controller: controller,
//       labelText: !hideLabelText ? labelText : null,
//       hintText: hintText,
//       textInputType: textInputType ?? TextInputType.name,
//       validator: validator,
//       validate: true,
//       onEditingComplete: () {
//         if (onSubmit.isNotNull) {
//           onSubmit!(controller.text);
//         }
//       },
//       onChanged: (value) {
//         if (onSubmit.isNotNull) {
//           onSubmit!(controller.text);
//         }
//       },
//     );
//   }
// }
//
// class EmailTextField extends HookWidget {
//   const EmailTextField({this.hideLabelText = false,
//   this.onSubmit, super.key});
//   final bool hideLabelText;
//   final void Function(String)? onSubmit;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = useTextEditingController();
//     final l10n = context.l10n;
//     return AppReusableTextField(
//       controller: controller,
//       labelText: !hideLabelText ? l10n.emailAddressText : null,
//       hintText: l10n.enterEmailAddressText,
//       textInputType: TextInputType.emailAddress,
//       validator: Validators.email(),
//       validate: true,
//       onEditingComplete: () {
//         if (onSubmit.isNotNull) {
//           onSubmit!(controller.text);
//         }
//       },
//       onChanged: (value) {
//         if (onSubmit.isNotNull) {
//           onSubmit!(controller.text);
//         }
//       },
//     );
//   }
// }
//
// class PasswordTextField extends HookWidget {
//   const PasswordTextField({
//     this.labelText,
//     this.hintText,
//     this.validator,
//     this.onChanged,
//     super.key,
//   });
//   final String? labelText;
//   final String? hintText;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String?>? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = useTextEditingController();
//     final hidePassword = useState(true);
//     final l10n = context.l10n;
//
//     return AppReusableTextField(
//       controller: controller,
//       labelText: labelText ?? l10n.passwordText,
//       hintText: hintText ?? l10n.enterPasswordText,
//       textInputType: TextInputType.visiblePassword,
//       validator: validator ?? Validators.password(),
//       validate: true,
//       hideText: hidePassword.value,
//       suffixIcon: _PasswordVisibilityIcon(
//         onTap: () {
//           hidePassword.value = !hidePassword.value;
//         },
//         isVisible: !hidePassword.value,
//       ),
//       onChanged: onChanged,
//     );
//   }
// }
//
// class _PasswordVisibilityIcon extends StatelessWidget {
//   const _PasswordVisibilityIcon({
//     required this.onTap,
//     required this.isVisible,
//   });
//
//   final VoidCallback onTap;
//   final bool isVisible;
//
//   @override
//   Widget build(BuildContext context) {
//     return ExcludeFocus(
//       child: IconButton(
//         onPressed: onTap,
//         icon: Icon(
//           color: context.theme.colorScheme.secondary,
//           switch (isVisible) {
//             true => Icons.visibility_outlined,
//             false => Icons.visibility_off_outlined,
//           },
//         ),
//       ),
//     );
//   }
// }
