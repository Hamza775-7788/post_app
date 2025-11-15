import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LodingDialgo extends StatelessWidget {
  const LodingDialgo({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}

showLoding() {
  Get.dialog(LodingDialgo(), barrierDismissible: false);
}
