import 'package:flutter/material.dart';
import 'package:quran/core/components/item_custom.dart';

import '../../../domain/entities/audio_entities.dart';

class AudioItem extends StatelessWidget {
  const AudioItem({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final int index;

  final AudioEntities data;

  @override
  Widget build(BuildContext context) {
    return ItemCustom(
      index: index,
      text: data.name,
    );
  }
}
