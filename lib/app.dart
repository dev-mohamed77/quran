import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/services/audio_player_service.dart';
import 'package:quran/core/services/connectivity_network_helper.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/routes_manager.dart';
import 'package:quran/core/utils/theme_custom.dart';
import 'package:quran/depence_injection.dart';
import 'package:quran/features/audios/presentation/manager/audio_bloc/bloc.dart';
import 'package:quran/features/audios/presentation/manager/audio_manager_bloc/bloc.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_bloc/bloc.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_bloc/event.dart';
import 'package:quran/features/onboarding/domain/usecase/onboarding_usecase.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/cubit.dart';
import 'package:quran/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:quran/features/quran/domain/usecase/quran_usecase_fetch_surah.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/bloc.dart';
import 'package:quran/features/quran/presentation/manager/surah_bloc/surah_bloc.dart';
import 'features/audios/domain/usecase/audio_usecase.dart';
import 'features/audios/presentation/manager/audio_bloc/event.dart';
import 'features/audios/presentation/manager/audio_the_reader_and_sura_name_bloc/bloc.dart';
import 'features/azkar/domain/use_case/fetch_azkar.dart';
import 'features/home/domain/usecase/home_usecase_section2.dart';
import 'features/home/presentation/manager/bloc/home_bloc.dart';
import 'features/onboarding/presentation/manager/bloc/onboardingbloc_bloc.dart';
import 'features/quran/presentation/manager/setting_bloc/bloc.dart';
import 'features/settings/presentation/manager/settings_bloc/bloc.dart';
import 'features/settings/presentation/manager/settings_bloc/state.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.kWhiteColor,
            elevation: 0,
          ),
        ),
        home: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        )
        // OnboardingScreen(),
        );
  }
}

class AppDemo extends StatelessWidget {
  const AppDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(
            onboardingUsecase: getIt<OnboardingUsecase>(),
          )..add(const OnboardingEvent.started()),
        ),
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(homeUsecase: getIt<HomeUsecase>())
            ..add(const HomeEvent.started()),
        ),
        BlocProvider(
          create: (context) => FetchQuranBloc(
            usecaseFetchSurahs: getIt<QuranUsecaseFetchSurah>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              AzkarBloc(useCaseFetchAzkar: getIt<UseCaseFetchAzkar>())
                ..add(FetchAzkarFromJson()),
        ),
        BlocProvider(
          create: (context) => SelectSurahBloc(),
        ),
        BlocProvider(
          create: (context) => SettingBloc(),
        ),
        BlocProvider(
          create: (context) => QuranSettingBloc(),
        ),
        BlocProvider(
          create: (context) => AudioBloc(
              audioUsecase: getIt<AudioUseCase>(),
              connectivityService: ConnectivityService())
            ..add(FetchAudioEvent()),
        ),
        BlocProvider(
          create: (context) => AudioManagerBloc(
            audioPlayerService: getIt<AudioPlayerService>(),
          ),
        ),
        BlocProvider(
          create: (context) => AudioTheReaderAndSurahNameBloc(),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeMode
                  ? ThemeCustom.darkTheme
                  : ThemeCustom.lightTheme,
              routes: RoutesManager.route,
              home: OnboardingScreen(),
            );
          },
        ),
      ),
    );
  }
}
