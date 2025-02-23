import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/app_text_style.dart';

customTextSpan(
    {required String firstText,
    required String lastText,
    TextStyle? firstStyle,
    TextStyle? lastStyle,
    Function()? onTap}) {
  return Center(
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: firstText,
          style: firstStyle ??
              AppTextStyle.roboto50018.copyWith(color: Colors.black)),
      TextSpan(
          text: lastText,
          style: lastStyle ?? AppTextStyle.roboto50018,
          recognizer: TapGestureRecognizer()..onTap = onTap)
    ])),
  );
}
