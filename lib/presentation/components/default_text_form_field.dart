import 'package:flutter/material.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    this.controller,
    required this.initialValue,
    required this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    required this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.suffix,
  });

  final String hintText;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? initialValue;
  final FocusNode? focusNode;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: context.font14w600,
        ),
        // 3.verticalSpace,
        TextFormField(
          style: context.font16w600,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: suffixIcon,
            suffix: suffix,
          ),
        ),
      ],
    );
  }
}
