import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/bloc.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/event.dart';
import 'package:quran/features/quran/presentation/pages/widgets/surahs/surahs_body.dart';

class SurahsScreen extends StatefulWidget {
  const SurahsScreen({Key? key}) : super(key: key);
  static String id = "SurahsScreen";

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchQuranBloc>(context).add(QuranEventStart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.quran,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const SurahsBody(),
      ),
    );
  }
}
