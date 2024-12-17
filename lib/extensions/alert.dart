import 'package:flutter/material.dart';

extension AlertExtension on BuildContext {
  void showCusDialog(Widget dialog) {
    showDialog(context: this, builder: (BuildContext context) => dialog);
  }
}
