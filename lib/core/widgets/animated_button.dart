import 'package:flutter/material.dart';
import 'package:market_news_app/core/extensions/extension.dart';
import 'package:market_news_app/core/widgets/custom_auto_size_text.dart';

class AnimatedButton extends StatefulWidget {
  final bool isLoading;
  final bool isEnable;
  final bool keyboardIsOpen;
  final bool keyboardAutoDetect;
  final String buttonText; // Button text from constructor, default is "Continue"
  final VoidCallback? onPressed;

  const AnimatedButton({
    Key? key,
    required this.isLoading, // Loading state
    required this.isEnable, // Enabled/Disabled state
    this.keyboardAutoDetect = true, // Toggle for keyboard detection
    this.keyboardIsOpen = false, // Toggle for keyboard detection
    this.buttonText = "Continue", // Default button text
    this.onPressed, // Custom onPress callback
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.isEnable && !widget.isLoading
              ? widget.onPressed
              : null, // Trigger the onPress callback if button is enabled and not loading
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: widget.keyboardAutoDetect && widget.keyboardIsOpen ? Alignment.centerRight : null,
            child: Container(
              height: 56,
              width: widget.keyboardAutoDetect && widget.keyboardIsOpen
                  ? 56
                  : double.infinity, // Adjust width based on keyboard state
              decoration: BoxDecoration(
                color: widget.isEnable ? context.primaryColor : context.primaryContainerColor, // Enabled/Disabled state
                borderRadius: BorderRadius.circular(widget.keyboardAutoDetect && widget.keyboardIsOpen ? 28 : 30),
              ),
              child: _buildButtonContent(widget.keyboardAutoDetect && widget.keyboardIsOpen),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the button content with text and spinner based on loading state
  Widget _buildButtonContent(bool isKeyboardOpen) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading && !isKeyboardOpen) ...[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: 10), // Spacing between spinner and text
        ],
        isKeyboardOpen
            ? Visibility(
                visible: !widget.isLoading,
                replacement: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            : CustomAutoSizeText(
                widget.buttonText,
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
