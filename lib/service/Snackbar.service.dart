import 'package:flutter/material.dart';

class SnackbarService {
  static void showSnackbar(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.green,
    int durationInSeconds = 1,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: durationInSeconds),
      ),
    );
  }

  static void showErrorSnackbar(
    BuildContext context, {
    required String message,
    int durationInSeconds = 1,
  }) {
    showSnackbar(
      context,
      message: message,
      backgroundColor: Colors.red,
      durationInSeconds: durationInSeconds,
    );
  }

  static void showSuccessSnackbar(
    BuildContext context, {
    required String message,
    int durationInSeconds = 1,
  }) {
    showSnackbar(
      context,
      message: message,
      backgroundColor: Colors.green,
      durationInSeconds: durationInSeconds,
    );
  }

  static void showInfoSnackbar(
    BuildContext context, {
    required String message,
    int durationInSeconds = 1,
  }) {
    showSnackbar(
      context,
      message: message,
      backgroundColor: Colors.blue,
      durationInSeconds: durationInSeconds,
    );
  }
}
