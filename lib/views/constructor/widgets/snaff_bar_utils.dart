import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning }

class SnaffBarUtils {
  static SnackBar showSnackBar(
    String message, [
    SnackBarType type = SnackBarType.success,
  ]) {
    Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.amber;
        break;
    }

    return SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
  }
}
