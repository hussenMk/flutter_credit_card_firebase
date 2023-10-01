import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';

class CustomTitle extends StatelessWidget {
  final String txt;
  const CustomTitle({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.blue,
        ),
      ),
    );
  }
}
