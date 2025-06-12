import 'package:flutter/material.dart';
import '../utils/theme_utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isOutlined;
  final bool isFullWidth;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final double? elevation;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isOutlined = false,
    this.isFullWidth = true,
    this.padding,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = isOutlined
        ? ThemeUtils.getOutlinedButtonStyle(context)
        : ThemeUtils.getElevatedButtonStyle(context);

    Widget button = isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: style.copyWith(
              backgroundColor: WidgetStateProperty.all(
                backgroundColor ?? theme.primaryColor,
              ),
              foregroundColor: WidgetStateProperty.all(
                foregroundColor ?? Colors.white,
              ),
              side: WidgetStateProperty.all(
                BorderSide(
                  color: backgroundColor ?? theme.primaryColor,
                  width: 1,
                ),
              ),
              padding: WidgetStateProperty.all(
                padding ??
                    const EdgeInsets.symmetric(
                      horizontal: ThemeUtils.kDefaultPadding * 1.5,
                      vertical: ThemeUtils.kDefaultPadding,
                    ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? ThemeUtils.kDefaultBorderRadius,
                  ),
                ),
              ),
              elevation: WidgetStateProperty.all(elevation ?? 0),
            ),
            child: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: style.copyWith(
              backgroundColor: WidgetStateProperty.all(
                backgroundColor ?? theme.primaryColor,
              ),
              foregroundColor: WidgetStateProperty.all(
                foregroundColor ?? Colors.white,
              ),
              padding: WidgetStateProperty.all(
                padding ??
                    const EdgeInsets.symmetric(
                      horizontal: ThemeUtils.kDefaultPadding * 1.5,
                      vertical: ThemeUtils.kDefaultPadding,
                    ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? ThemeUtils.kDefaultBorderRadius,
                  ),
                ),
              ),
              elevation: WidgetStateProperty.all(elevation ?? 2),
            ),
            child: child,
          );

    if (isFullWidth) {
      button = SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: button,
      );
    } else if (width != null || height != null) {
      button = SizedBox(
        width: width,
        height: height,
        child: button,
      );
    }

    return button;
  }
}
