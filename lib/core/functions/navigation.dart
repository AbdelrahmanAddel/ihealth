import 'package:flutter/material.dart';

class Navigation {
  static push({required BuildContext context, required Widget pushScreen}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => pushScreen));
  }

  static pop({required BuildContext context}) {
    Navigator.pop(context);
  }

  static pushRepl({required BuildContext context, required Widget pushScreen}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => pushScreen));
  }
}
