import 'dart:developer';

import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  log('this development');
  setupGetIt();
  runApp(const DocApp());
}
