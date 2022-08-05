import 'package:flutter/material.dart';

class TextFieldWidget extends TextFormField {
  late final BuildContext? context;
  late final TextEditingController? textController;
  late final Color? cursorColor;
  late final String? hintText;
  late final VoidCallback? onTap;
  late final Color? textColor;
  late final Color? hintTextColor;
  late final dynamic suffixIcon;
  late final dynamic suffixIconColor;
  late final TextInputType? textInputType;
  late final dynamic inputBorder;
  late final bool obscureText;


  late final String? Function(String?)? validators;
  TextFieldWidget(
      {Key? key,
        this.context,
        this.textController,
        this.onTap,
        this.cursorColor,
        this.hintText,
        this.textColor,
        this.hintTextColor = Colors.black26,
        this.suffixIcon,
        this.suffixIconColor,
        this.validators,
        this.obscureText = false})
      : super(
    key: key,
    controller: textController,
    cursorColor: cursorColor,
    onTap: onTap,
    obscureText:obscureText ,
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0xFFECEFF1),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      suffixIcon: null == suffixIcon
          ? null
          : Icon(
        suffixIcon,
        color: suffixIconColor,
      ),
      hintText: hintText,

      hintStyle: TextStyle(color: hintTextColor),
      // labelText: "sad",
    ),
    validator: validators,
  );
}
