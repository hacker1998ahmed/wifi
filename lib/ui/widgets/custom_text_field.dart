import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/theme_utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.contentPadding,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decoration = ThemeUtils.getTextFieldDecoration(
      context,
      label: label,
      hint: hint,
      prefixIcon: prefixIcon,
      suffix: suffix,
    ).copyWith(
      filled: true,
      fillColor: backgroundColor ?? theme.inputDecorationTheme.fillColor,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: ThemeUtils.kDefaultPadding,
            vertical: ThemeUtils.kDefaultPadding * 0.75,
          ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeUtils.kDefaultBorderRadius,
        ),
        borderSide: BorderSide(
          color: borderColor ?? theme.dividerColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeUtils.kDefaultBorderRadius,
        ),
        borderSide: BorderSide(
          color: borderColor ?? theme.dividerColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeUtils.kDefaultBorderRadius,
        ),
        borderSide: BorderSide(
          color: borderColor ?? theme.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeUtils.kDefaultBorderRadius,
        ),
        borderSide: BorderSide(
          color: ThemeUtils.kStatusColors['error']!,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeUtils.kDefaultBorderRadius,
        ),
        borderSide: BorderSide(
          color: ThemeUtils.kStatusColors['error']!,
          width: 2,
        ),
      ),
      labelStyle: labelStyle ?? theme.inputDecorationTheme.labelStyle,
      hintStyle: hintStyle ?? theme.inputDecorationTheme.hintStyle,
      errorStyle: errorStyle ?? theme.inputDecorationTheme.errorStyle,
    );

    Widget textField = TextFormField(
      controller: controller,
      decoration: decoration,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      focusNode: focusNode,
      style: style ?? theme.textTheme.bodyMedium,
    );

    if (width != null || height != null) {
      textField = SizedBox(
        width: width,
        height: height,
        child: textField,
      );
    }

    return textField;
  }
}
