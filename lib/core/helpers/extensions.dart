import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Push a new page
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace with a new page
  Future<T?> pushReplacement<T, TO>(Widget page, {TO? result}) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }

  /// Push and remove all previous routes
  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
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
