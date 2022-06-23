import 'package:flutter/material.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/settings/presentation/pages/widgets/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String id = "Settings Screen";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.settings,
          ),
        ),
        body: const SettingsBody(),
      ),
    );
  }
}
