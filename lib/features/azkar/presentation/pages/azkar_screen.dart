import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/azkar/presentation/pages/widgets/azkar/azkar_body.dart';

import '../manager/tab_bloc/bloc.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  static String id = "AzkarScreen";

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.azkar),
        ),
        body: BlocProvider(
          create: (context) => TabBloc(_controller),
          child: const AzkarBody(),
        ),
      ),
    );
  }
}
