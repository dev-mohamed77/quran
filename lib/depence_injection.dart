import 'package:get_it/get_it.dart';
import 'package:quran/core/services/audio_player_service.dart';
import 'package:quran/features/audios/data/data_source/audio_data_source_remote.dart';
import 'package:quran/features/audios/data/repositories/audio_repo_imp.dart';
import 'package:quran/features/audios/domain/repositories/audio_repositories.dart';
import 'package:quran/features/audios/domain/usecase/audio_usecase.dart';
import 'package:quran/features/azkar/data/data_source/azkar_local_data_source.dart';
import 'package:quran/features/azkar/data/repositories/repositories_imp.dart';
import 'package:quran/features/azkar/domain/use_case/fetch_azkar.dart';
import 'package:quran/features/hadith/data/data_source/hadith_local_data_source.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_bukhari.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_ibn_maja.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_malik.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_muslim.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_nasai.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_trmizi.dart';
import 'package:quran/features/home/data/data_source/home_local_data_source.dart';
import 'package:quran/features/home/data/repositories/home_repositories_imp.dart';
import 'package:quran/features/home/domain/repositories/home_repositories.dart';
import 'package:quran/features/onboarding/data/data_source/onboarding_loacal_data_source.dart';
import 'package:quran/features/onboarding/data/repositories/onboarding_imp.dart';
import 'package:quran/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:quran/features/onboarding/domain/usecase/onboarding_usecase.dart';

import 'core/helper/dio_helper.dart';
import 'features/azkar/domain/repositories/repositories.dart';
import 'features/hadith/data/repository/repositories_imp.dart';
import 'features/hadith/domain/repositories/repositories.dart';
import 'features/home/domain/usecase/home_usecase_section2.dart';
import 'features/quran/data/data_source/quran_local_data_source.dart';
import 'features/quran/data/repositories/quran_repositories_imp.dart';
import 'features/quran/domain/repositories/repositories.dart';
import 'features/quran/domain/usecase/quran_usecase_fetch_surah.dart';

GetIt getIt = GetIt.instance;

Future<void> initApp() async {
  getIt.registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImp());

  getIt.registerLazySingleton<OnboardingRepositories>(
    () => OnboardingRepositoriesImp(
      localDataSource: getIt<OnboardingLocalDataSource>(),
    ),
  );

  getIt.registerFactory<OnboardingUsecase>(
    () => OnboardingUsecase(
      repo: getIt<OnboardingRepositories>(),
    ),
  );

  // Home Repo

  getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImp());

  getIt.registerLazySingleton<HomeRepositories>(
    () => HomeRepositoriesImp(
      localDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  getIt.registerFactory<HomeUsecase>(
    () => HomeUsecase(
      repo: getIt<HomeRepositories>(),
    ),
  );

  // Quran

  getIt.registerLazySingleton<QuranLocalDataSource>(
      () => QuranLocalDataSourceImp());

  getIt.registerLazySingleton<QuranRepositories>(
    () => QuranRepositoriesImp(
      localDataSource: getIt<QuranLocalDataSource>(),
    ),
  );

  getIt.registerFactory<QuranUsecaseFetchSurah>(
    () => QuranUsecaseFetchSurah(
      repo: getIt<QuranRepositories>(),
    ),
  );

  // Azkar

  getIt.registerLazySingleton<AzkarLocalDataSource>(
      () => AzkarLocalDataSourceImp());

  getIt.registerLazySingleton<AzkarRepositories>(
    () => AzkarRepositoriesImp(
      azkarLocalDataSource: getIt<AzkarLocalDataSource>(),
    ),
  );

  getIt.registerFactory<UseCaseFetchAzkar>(
    () => UseCaseFetchAzkar(
      repo: getIt<AzkarRepositories>(),
    ),
  );

  // Hadith

  getIt.registerLazySingleton<HadithLocaLDataSource>(
      () => HadithLocaLDataSourceImp());

  getIt.registerLazySingleton<HadithRepositories>(
    () => HadithRepositoriesImp(
      dataSource: getIt<HadithLocaLDataSource>(),
    ),
  );

  getIt.registerFactory<HadithUseCaseFetchHadithBukhari>(
    () => HadithUseCaseFetchHadithBukhari(
      repo: getIt<HadithRepositories>(),
    ),
  );
  getIt.registerFactory<HadithUseCaseFetchHadithIbnMaja>(
    () => HadithUseCaseFetchHadithIbnMaja(
      repo: getIt<HadithRepositories>(),
    ),
  );
  getIt.registerFactory<HadithUseCaseFetchHadithMalik>(
    () => HadithUseCaseFetchHadithMalik(
      repo: getIt<HadithRepositories>(),
    ),
  );
  getIt.registerFactory<HadithUseCaseFetchHadithMuslim>(
    () => HadithUseCaseFetchHadithMuslim(
      repo: getIt<HadithRepositories>(),
    ),
  );
  getIt.registerFactory<HadithUseCaseFetchHadithNasai>(
    () => HadithUseCaseFetchHadithNasai(
      repo: getIt<HadithRepositories>(),
    ),
  );
  getIt.registerFactory<HadithUseCaseFetchHadithTrmizi>(
    () => HadithUseCaseFetchHadithTrmizi(
      repo: getIt<HadithRepositories>(),
    ),
  );

  // Audio

  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<AudioDataSourceRemote>(
    () => AudioDataSourceRemoteImp(
      dio: getIt<DioHelper>(),
    ),
  );

  getIt.registerLazySingleton<AudioRepositories>(
    () => AudioRepositoriesImp(
      remoteDataSource: getIt<AudioDataSourceRemote>(),
    ),
  );

  getIt.registerFactory<AudioUseCase>(
    () => AudioUseCase(
      repo: getIt<AudioRepositories>(),
    ),
  );

  getIt.registerFactory<AudioPlayerService>(
    () => AudioPlayerService(),
  );
}
