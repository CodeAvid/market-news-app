import 'package:flutter/material.dart';
import 'package:market_news_app/core/extensions/extension.dart';
import 'package:market_news_app/core/widgets/custom_auto_size_text.dart';

class AnimatedButton extends StatefulWidget {
  final bool isLoading;
  final bool isEnable;
  final bool keyboardAutoDetect;
  final VoidCallback? onPressed; // Custom on-press action from constructor
  final String text;

  const AnimatedButton({
    Key? key,
    required this.isLoading, // Loading state
    required this.isEnable, // Button enabled/disabled state
    this.keyboardAutoDetect = true, // Toggle for keyboard detection
    this.onPressed,
    this.text = 'Continue', // User-defined onPress callback
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  late bool _keyboardIsOpen;

  @override
  void initState() {
    super.initState();
    _keyboardIsOpen = false; // Initial keyboard state
  }

  @override
  Widget build(BuildContext context) {
    // Detect keyboard state if enabled
    if (widget.keyboardAutoDetect) {
      _keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: widget.isEnable && !widget.isLoading
            ? widget.onPressed
            : null, // Use the custom onPress from the constructor
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 56,
          width: _keyboardIsOpen ? 56 : double.infinity, // Width based on keyboard state
          margin: EdgeInsets.symmetric(horizontal: _keyboardIsOpen ? 0 : 20), // Margin for better appearance
          decoration: BoxDecoration(
            color: widget.isEnable ? context.primaryColor : context.primaryContainerColor, // Active/Inactive state
            borderRadius: BorderRadius.circular(_keyboardIsOpen ? 28 : 30),
          ),
          child: Center(
            child: _buildButtonContent(),
          ),
        ),
      ),
    );
  }

  // Builds the button content with text and spinner based on loading state
  Widget _buildButtonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading) ...[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          SizedBox(width: 10), // Spacing between spinner and text
        ],
        CustomAutoSizeText(
          widget.text,
          style: context.bodyMedium?.copyWith(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
