import 'package:flutter/material.dart';
import 'package:doctor_app/resources/styles_manager.dart';

class GetButtonWidget extends StatelessWidget {
  GetButtonWidget({
    Key? key,
    required this.onPressed,
    required this.btnText,
    required this.btnColor,
    required this.btnTextColor,
    this.height,
    this.width,
    this.borderColor,
  }) : super(key: key);
  VoidCallback onPressed;
  String btnText;
  Color btnColor;
  Color btnTextColor;
  double? height;
  double? width;
  Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(width ?? double.maxFinite, height ?? 60),
        ),
        backgroundColor: WidgetStateProperty.all(btnColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
      ),
      child: Text(
        btnText,
        style: getBoldStyle(color: btnTextColor, fontSize: 16),
      ),
    );
  }
}
