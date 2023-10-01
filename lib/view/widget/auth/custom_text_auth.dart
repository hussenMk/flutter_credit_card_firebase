import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';

class CustomTextAuth extends StatelessWidget {
  final String txt;
  const CustomTextAuth({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.blue,
      ),
    );
  }
}
