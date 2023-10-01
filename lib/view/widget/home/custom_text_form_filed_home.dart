import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';

class CustomTextFormFieldHome extends StatelessWidget {
  const CustomTextFormFieldHome({
    super.key,
    this.controller,
    required this.hintText,
    required this.maxLength,
    required this.textInputType,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final int maxLength;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.blue,
        ),
        fillColor: const Color.fromARGB(255, 237, 237, 237),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
      ),
      maxLength: maxLength,
    );
  }
}
