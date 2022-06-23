import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';

import '../../../../../core/components/container_custom.dart';
import '../../../domain/entities/audio_entities.dart';
import '../../manager/audio_bloc/bloc.dart';
import '../../manager/audio_manager_bloc/bloc.dart';
import '../../manager/audio_manager_bloc/event.dart';
import '../../manager/audio_manager_bloc/state.dart';
import '../../manager/audio_the_reader_and_sura_name_bloc/bloc.dart';
import '../../manager/audio_the_reader_and_sura_name_bloc/event.dart';
import '../../manager/audio_the_reader_and_sura_name_bloc/state.dart';

class AudioRecitationsItemBody extends StatelessWidget {
  const AudioRecitationsItemBody({
    Key? key,
    required this.audioData,
    required this.surasData,
  }) : super(key: key);

  final AudioEntities audioData;
  final List<String> surasData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: surasData.length,
            itemBuilder: (context, index) {
              var filterList =
                  Map.from(BlocProvider.of<AudioBloc>(context).quranData)
                    ..removeWhere((key, value) => key != surasData[index]);

              return InkWell(
                  onTap: () {
                    context
                        .read<AudioManagerBloc>()
                        .add(AudioManagerIsPlay(isPlay: true));

                    BlocProvider.of<AudioManagerBloc>(context)
                        .add(AudioManagerPlay(
                      url:
                          "${audioData.server}/${BlocProvider.of<AudioManagerBloc>(context).quranUrl(surasData[index])}",
                    ));

                    context.read<AudioTheReaderAndSurahNameBloc>().add(
                          AudioTheReaderAndSurahName(
                            theReader: audioData.name,
                            surahName: filterList.values.join().toString(),
                          ),
                        );
                  },
                  child: AudioSurahItem(
                    index: index,
                    surahNumber: surasData[index],
                    surahName: filterList.values.join().toString(),
                  ));
            },
          ),
        ),
        BlocBuilder<AudioManagerBloc, AudioManagerState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
              color: ColorManager.kPurpleColor,
              width: double.infinity,
              child: Column(
                children: [
                  Column(
                    children: [
                      BlocBuilder<AudioTheReaderAndSurahNameBloc,
                          AudioTheReaderAndSurahNameState>(
                        builder: (context, stateNameReaderAndSurah) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                _textCustom(
                                    stateNameReaderAndSurah.theReader, context),
                                const Spacer(),
                                _textCustom(
                                    stateNameReaderAndSurah.surahName, context),
                              ],
                            ),
                          );
                        },
                      ),
                      Slider(
                        value: state.positionAudio.inSeconds.toDouble(),
                        max: state.allTimeAudio.inSeconds.toDouble(),
                        min: 0,
                        onChanged: (val) {
                          context.read<AudioManagerBloc>().add(
                                AudioManagerSeek(
                                  position: Duration(seconds: val.toInt()),
                                ),
                              );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            _textCustom("${state.positionAudio}", context),
                            const Spacer(),
                            _textCustom("${state.allTimeAudio}", context),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButtonPlayManagerCustom(
                        icon: const Icon(Icons.first_page),
                        onPressed: () {
                          context.read<AudioManagerBloc>().add(
                                AudioManagerSeek(
                                  position: Duration(
                                    seconds:
                                        state.positionAudio.inSeconds.toInt() -
                                            30,
                                  ),
                                ),
                              );
                        },
                      ),
                      IconButtonPlayManagerCustom(
                        isCenterButton: true,
                        icon: Icon(
                          state.isPlay ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: () {
                          if (state.isPlay) {
                            context.read<AudioManagerBloc>().add(
                                  AudioManagerIsPlay(
                                    isPlay: false,
                                  ),
                                );
                            context
                                .read<AudioManagerBloc>()
                                .add(AudioManagerPause());
                          } else {
                            context.read<AudioManagerBloc>().add(
                                  AudioManagerIsPlay(
                                    isPlay: true,
                                  ),
                                );
                            context
                                .read<AudioManagerBloc>()
                                .add(AudioManagerResume());
                          }
                        },
                      ),
                      IconButtonPlayManagerCustom(
                        icon: const Icon(Icons.last_page),
                        onPressed: () {
                          context.read<AudioManagerBloc>().add(
                                AudioManagerSeek(
                                  position: Duration(
                                      seconds: state.positionAudio.inSeconds
                                              .toInt() +
                                          30),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget _textCustom(String text, BuildContext ctx) {
    return Text(
      text,
      style: Theme.of(ctx).textTheme.bodyText2!.copyWith(
            color: ColorManager.kWhiteColor,
            fontSize: 14.sp,
          ),
    );
  }
}

class IconButtonPlayManagerCustom extends StatelessWidget {
  const IconButtonPlayManagerCustom({
    Key? key,
    required this.icon,
    required this.onPressed,
    bool isCenterButton = false,
  })  : _isCenterButton = isCenterButton,
        super(key: key);

  final Widget icon;
  final VoidCallback onPressed;
  final bool _isCenterButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _isCenterButton ? EdgeInsets.all(5.r) : EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: ColorManager.kWhiteColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

class AudioSurahItem extends StatelessWidget {
  const AudioSurahItem({
    Key? key,
    required this.index,
    required this.surahNumber,
    required this.surahName,
  }) : super(key: key);
  final int index;
  final String surahNumber;
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return ContainerCustom(
      index: index,
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: (index % 2 == 0)
                ? ColorManager.kYellowColor
                : ColorManager.kPurpleColor,
            child: Padding(
              padding: EdgeInsets.only(top: 4.2.h),
              child: Text(
                surahNumber,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: (index % 2 == 0)
                        ? ColorManager.kPurpleColor
                        : ColorManager.kWhiteColor),
              ),
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          Text(
            surahName,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: (index % 2 == 0)
                      ? ColorManager.kWhiteColor
                      : ColorManager.kPurpleColor,
                ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.download,
              color: (index % 2 == 0)
                  ? ColorManager.kWhiteColor
                  : ColorManager.kPurpleColor,
            ),
          ),
        ],
      ),
    );
  }
}
