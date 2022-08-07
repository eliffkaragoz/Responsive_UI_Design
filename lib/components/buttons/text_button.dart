import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: textColor, fontSize: textSize)),
    );
  }
}
