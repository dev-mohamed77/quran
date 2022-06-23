import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/quran/presentation/manager/setting_bloc/event.dart';
import 'package:quran/features/quran/presentation/manager/setting_bloc/state.dart';

class QuranSettingBloc extends Bloc<QuranSettingEvent, QuranSettingState> {
  QuranSettingBloc() : super(const QuranSettingState(showTafseer: false)) {
    on<ShowTafseer>(_onShowTafseer);
  }

  _onShowTafseer(ShowTafseer event, Emitter<QuranSettingState> emit) {
    emit(QuranSettingState(showTafseer: event.showTafseer));
  }
}
