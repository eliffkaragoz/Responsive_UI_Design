import 'package:flutter/material.dart';

class ElevatedButtonWidget extends ElevatedButton {
  late final BuildContext context;
  late final VoidCallback onPres;
  late final String text;
  late final Color? buttonColor;
  late final Color? textColor;
  late final  double textSize;
  late final double buttonHeight;
  late final double buttonWeight;
  late final  Color? borderSideColor;
  ElevatedButtonWidget(
      {Key? key,
      required this.context,
      required this.onPres,
      required this.text,
      this.textSize = 16,
      this.buttonColor  ,
      this.textColor,
      this.buttonHeight = 50,
      this.buttonWeight = 340,
      this.borderSideColor =  Colors.transparent,
      })
      : super(
          key: key,
          onPressed: onPres,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text( text,style: Theme.of(context).textTheme.bodySmall?.copyWith(color:textColor ,fontSize: textSize)),
             ],),


          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side:BorderSide( color: borderSideColor!,) ,
                borderRadius: BorderRadius.circular(15.0),
              ),
              primary: buttonColor,
              fixedSize: Size(buttonWeight, buttonHeight)),
        );
}
