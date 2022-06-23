import 'package:flutter/material.dart';
import 'package:quran/app.dart';
import 'package:quran/depence_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(const AppDemo());
}
