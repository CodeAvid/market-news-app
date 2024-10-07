import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum ButtonState { idle, loading, success, error }

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.onPressed,
    required this.controller,
    this.height = 55.0,
    this.width = 225.0,
    this.loaderSize = 50.0,
    this.loaderStrokeWidth = 1.5,
    this.primaryColor,
    this.errorColor = Colors.redAccent,
    this.successColor = Colors.green,
    this.iconColor,
    this.iconData,
    this.successIcon = Icons.check,
    this.failedIcon = Icons.close,
    this.duration = const Duration(milliseconds: 500),
    this.borderRadius = 25.0,
  }) : super(key: key);

  /// Callback when the button is pressed
  final VoidCallback onPressed;

  /// Controller to manage button states
  final AnimatedButtonController controller;

  /// Button height
  final double height;

  /// Button width
  final double width;

  /// Loader size
  final double loaderSize;

  /// Loader stroke width
  final double loaderStrokeWidth;

  /// Primary color of the button
  final Color? primaryColor;

  /// Error state color
  final Color? errorColor;

  /// Success state color
  final Color? successColor;

  /// Icon color for the button
  final Color? iconColor;

  /// Icon to display in the button
  final IconData? iconData;

  /// Success state icon
  final IconData successIcon;

  /// Error state icon
  final IconData failedIcon;

  /// Animation duration
  final Duration duration;

  /// Border radius of the button
  final double borderRadius;

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation<double> _squeezeAnimation;
  final _state = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(duration: widget.duration, vsync: this);

    _squeezeAnimation = Tween<double>(begin: widget.width, end: widget.height)
        .animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeInOutCirc));

    _squeezeAnimation.addListener(() {
      setState(() {});
    });

    // Link the controller methods to the state changes
    widget.controller._addListeners(_startLoading, _success, _error, _reset);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _state.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonState = _state.value;

    Widget buildChild() {
      if (buttonState == ButtonState.loading) {
        return SizedBox(
          height: widget.loaderSize,
          width: widget.loaderSize,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.iconColor ?? theme.primaryColor,
            ),
            strokeWidth: widget.loaderStrokeWidth,
          ),
        );
      } else if (buttonState == ButtonState.success) {
        return Icon(
          widget.successIcon,
          color: widget.successColor,
        );
      } else if (buttonState == ButtonState.error) {
        return Icon(
          widget.failedIcon,
          color: widget.errorColor,
        );
      } else {
        // Default idle state
        return Icon(
          widget.iconData,
          color: widget.iconColor,
        );
      }
    }

    return SizedBox(
      height: widget.height,
      width: _squeezeAnimation.value,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          backgroundColor: buttonState == ButtonState.success
              ? widget.successColor
              : buttonState == ButtonState.error
                  ? widget.errorColor
                  : widget.primaryColor ?? theme.primaryColor,
        ),
        onPressed: _state.value == ButtonState.loading ? null : widget.onPressed,
        child: Center(
          child: buildChild(),
        ),
      ),
    );
  }

  void _startLoading() {
    _state.sink.add(ButtonState.loading);
    _buttonController.forward();
  }

  void _success() {
    _state.sink.add(ButtonState.success);
    _buttonController.reverse();
  }

  void _error() {
    _state.sink.add(ButtonState.error);
    _buttonController.reverse();
  }

  void _reset() {
    _state.sink.add(ButtonState.idle);
    _buttonController.reverse();
  }
}

class AnimatedButtonController {
  late VoidCallback _startLoadingListener;
  late VoidCallback _successListener;
  late VoidCallback _errorListener;
  late VoidCallback _resetListener;

  void _addListeners(VoidCallback startLoading, VoidCallback success, VoidCallback error, VoidCallback reset) {
    _startLoadingListener = startLoading;
    _successListener = success;
    _errorListener = error;
    _resetListener = reset;
  }

  /// Start the loading process
  void startLoading() {
    _startLoadingListener();
  }

  /// Set the button to the success state
  void success() {
    _successListener();
  }

  /// Set the button to the error state
  void error() {
    _errorListener();
  }

  /// Reset the button to its default state
  void reset() {
    _resetListener();
  }
}
