import 'package:flutter/material.dart';

class TextButtonWidget extends TextButton {
  late final BuildContext context;
  late final VoidCallback onPres;
  late final String buttonText;
  late final Color? textColor;
  late final double? textSize;

  TextButtonWidget(
      {Key? key,
        required this.context,
        required this.onPres,
        required this.buttonText,
        this.textColor = const  Color(0xFF283593),
        this.textSize = 15
      })
      : super(
    key: key,
    onPressed: onPres,
    child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:textColor ,fontSize: textSize)
      //TextStyle(color: textColor,),
    ),
  );
}
