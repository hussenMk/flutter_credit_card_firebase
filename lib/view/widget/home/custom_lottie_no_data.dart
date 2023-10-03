import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:lottie/lottie.dart';

class CustomLottieNoData extends StatelessWidget {
  const CustomLottieNoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/crdit-card.json'),
            const SizedBox(),
            const Text(
              "You don't have credit cards !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.blue,
              ),
            ),
          ],
        ),
      );
  }
}
