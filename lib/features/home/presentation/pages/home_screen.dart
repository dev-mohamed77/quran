import 'package:flutter/material.dart';
import 'package:quran/core/components/custom_drawer.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/home/presentation/pages/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = StringsManager.homeID;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: Text(
            StringsManager.home,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const HomeBody(),
      ),
    );
  }
}
