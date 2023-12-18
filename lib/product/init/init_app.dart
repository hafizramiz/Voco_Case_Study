import 'package:flutter/material.dart';
import 'package:voco_case_study/product/services/shared_pref_service.dart';

@immutable
class AppInit {
  AppInit._();
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPref.instance.setup();
  }
}