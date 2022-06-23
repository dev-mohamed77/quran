import 'package:flutter/material.dart';
import 'package:quran/features/audios/presentation/pages/audio_recitations_item_scree.dart';
import 'package:quran/features/audios/presentation/pages/audio_screen.dart';
import 'package:quran/features/azkar/presentation/pages/azkar_screen.dart';
import 'package:quran/features/home/presentation/pages/home_screen.dart';
import 'package:quran/features/quran/presentation/pages/surahs_screen.dart';
import 'package:quran/features/settings/presentation/pages/settings_screen.dart';
import '../../features/hadith/presentation/pages/hadith_screen.dart';
import '../../features/quran/presentation/pages/selected_quran_screen.dart';

class RoutesManager {
  static Map<String, Widget Function(BuildContext)> route = {
    HomeScreen.id: (context) => const HomeScreen(),
    SurahsScreen.id: (context) => const SurahsScreen(),
    SelectedQuranScreen.id: (context) => const SelectedQuranScreen(),
    SettingsScreen.id: (context) => const SettingsScreen(),
    HadithScreen.id: (context) => const HadithScreen(),
    AzkarScreen.id: (context) => const AzkarScreen(),
    AudioScreen.id: (context) => const AudioScreen(),
    AudioRecitationsItem.id: (context) => const AudioRecitationsItem(),
  };
}
