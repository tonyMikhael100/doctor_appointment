import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          title,
          style: AppTextSytles.font24BlueBold,
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                context.pop();
                onCancel?.call();
              },
              child: Text(
                cancelText,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          if (confirmText != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
              child: Text(
                confirmText,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
