import 'package:arch/core/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String hintText;
  final String? labelText;

  final String? svgPrefixIconPath;
  final String? svgSuffixIconPath;
  final VoidCallback? suffixIconPress;
  final VoidCallback? onTap;
  final bool? isEnabled;

  final String? Function(String? value)? onSave;
  final dynamic Function(String? value)? onChange;
  final String? Function(String? value)? validator;

  final bool? isPasswordField;
  final int? maxLines;
  final int? maxLength;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? textStyle;
  final double? width;

  const DefaultTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.textStyle,
    this.labelText,
    this.svgPrefixIconPath,
    this.svgSuffixIconPath,
    this.suffixIconPress,
    this.onTap,
    this.isEnabled = true,
    this.onSave,
    this.onChange,
    this.errorText,
    this.isPasswordField = false,
    this.maxLines,
    this.maxLength,
    this.suffixIconColor,
    this.prefixIconColor,
    this.validator,
    this.width,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isObscure = true;

  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TapRegion(
      onTapOutside: (tap) {
        FocusScope.of(context).unfocus();
        _focus.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width ?? MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border:
                  widget.errorText != null
                      ? Border.all(color: AppColors.error, width: 2)
                      : _focus.hasFocus
                      ? Border.all(color: AppColors.brand800, width: 2)
                      : Border.all(color: AppColors.borderDefault, width: 2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.labelText != null)
                  Text(
                    widget.labelText!,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                TextFormField(
                  focusNode: _focus,
                  onTapOutside: (_) {
                    _focus.unfocus();
                    setState(() {});
                  },
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines ?? 1,
                  keyboardType: TextInputType.text,
                  controller: widget.controller,
                  style:
                      widget.textStyle ??
                      textTheme.labelSmall?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                  onTap: () {
                    _focus.requestFocus();
                    widget.onTap?.call();
                    setState(() {});
                  },
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onChanged:
                      widget.onChange != null
                          ? (v) => widget.onChange!(v)
                          : null,
                  obscuringCharacter: "*",
                  enabled: widget.isEnabled,
                  cursorColor: AppColors.primary,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    errorMaxLines: 2,
                    isDense: true,
                    filled: false,
                    fillColor: Colors.white,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    labelStyle: widget.textStyle,
                    hintStyle: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    prefixIcon:
                        widget.svgPrefixIconPath == null
                            ? null
                            : SizedBox(
                              child: SvgPicture.asset(
                                widget.svgPrefixIconPath!,
                                colorFilter: ColorFilter.mode(
                                  widget.errorText != null
                                      ? AppColors.error
                                      : widget.prefixIconColor ??
                                          AppColors.icon,
                                  BlendMode.srcIn,
                                ),
                                height: 0,
                                width: 0,
                              ),
                            ),
                    suffix:
                        widget.isPasswordField == true
                            ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: SvgPicture.asset(
                                "images/icons/${isObscure ? "eye-slash" : "eye"}.svg",
                                colorFilter:
                                    widget.suffixIconColor == null
                                        ? null
                                        : ColorFilter.mode(
                                          widget.suffixIconColor!,
                                          BlendMode.srcIn,
                                        ),
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            )
                            : widget.svgSuffixIconPath == null
                            ? null
                            : GestureDetector(
                              onTap: widget.suffixIconPress,
                              child: SvgPicture.asset(
                                widget.svgSuffixIconPath!,
                                colorFilter: ColorFilter.mode(
                                  widget.suffixIconColor ?? AppColors.icon,
                                  BlendMode.srcIn,
                                ),
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                  ),
                  obscureText: isObscure && widget.isPasswordField!,
                  onSaved:
                      widget.onSave == null ? null : (v) => widget.onSave!(v),
                  validator:
                      widget.validator == null
                          ? null
                          : (v) => widget.validator!(v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (widget.errorText != null)
            Text(
              widget.errorText!,
              style: textTheme.bodyLarge?.copyWith(color: AppColors.error),
              maxLines: 2,
            ),
        ],
      ),
    );
  }
}
