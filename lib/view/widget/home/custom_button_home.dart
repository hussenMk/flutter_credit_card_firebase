import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class CustomMaterialButtonHome extends GetView<HomeScreenController> {
  const CustomMaterialButtonHome({
    required this.onPressed,
    required this.txt,
    required this.color,
    super.key,
  });

  final void Function()? onPressed;
  final String txt;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
      onPressed: onPressed,
      textColor: color,
      child: Text(
        txt,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
