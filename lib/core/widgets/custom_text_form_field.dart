import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.isSecure = false,
    this.onPress,
  });

  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool isSecure;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ColorsManager.white),
      obscureText: isSecure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: onPress, icon: Icon(suffixIcon))
                : null,
      ),
    );
  }
}
