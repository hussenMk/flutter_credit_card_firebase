import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/core/constant/image_asset.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.blue,
      maxRadius: 50,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.grey[300],
        ),
        child: Image.asset(
          ImageAsset.logo,
          height: 60,
          width: 60,
        ),
      ),
    );
  }
}
