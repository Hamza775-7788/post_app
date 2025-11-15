import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGenralButton extends StatelessWidget {
  const MyGenralButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
  });
  final Function() onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color ?? Colors.blue.shade500,

          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(text, style: TextStyle(color: textColor ?? Colors.white)),
      ),
    );
  }
}
