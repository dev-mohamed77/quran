part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loaded(HomeEntities data) = _Loaded;
  const factory HomeState.error(String msg) = _Error;
}
