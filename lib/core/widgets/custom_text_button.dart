import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.onPress,
    required this.title,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black, // لون افتراضي لو مش اتبعت حاجة
        ),
      ),
    );
  }
}
