import 'package:flutter/material.dart';

import '../../constants/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.textFormHintText, this.controller});
  final String textFormHintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field Can't Be Null";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: textFormHintText,
          hintStyle: AppTextStyle.roboto40015,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
