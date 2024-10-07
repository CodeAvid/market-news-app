import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.isUnderlined = true,
    this.hasBackButton = true,
    super.key,
    this.leading,
  });

  final Widget? leading;
  final String title;
  final bool hasBackButton;
  final bool isUnderlined;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: leading ??
              (hasBackButton
                  ? const BackButton(
                      color: Color(0xFF828282),
                    )
                  : const SizedBox()),
          title: Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((kToolbarHeight + 16).h);
}
