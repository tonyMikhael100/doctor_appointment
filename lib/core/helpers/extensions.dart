import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Push a new page
  Future<T?> pushNamed<T>(String page) {
    return Navigator.of(this).pushNamed(page);
  }

  /// Replace with a new page
  Future<T?> pushReplacementNamed<T, TO>(String page, {TO? result}) {
    return Navigator.of(this).pushReplacementNamed(
      page,
      result: result,
    );
  }

  /// Push and remove all previous routes
  Future<T?> pushAndRemoveAllNamed<T>(String page) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      page,
      (route) => false,
    );
  }

  /// Pop the current page
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Pop until first route
  void popToFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}
