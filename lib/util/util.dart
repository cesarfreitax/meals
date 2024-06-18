import 'package:flutter/material.dart';

class Util {
  getInfoMessage(String message, BuildContext ctx) {
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}