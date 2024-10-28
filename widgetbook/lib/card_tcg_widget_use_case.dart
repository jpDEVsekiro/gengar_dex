import 'package:flutter/material.dart';
import 'package:gengar_dex/app/design_system/widgets/card_tcg_widget.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/enums/card_image_quality.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CardTcgWidget)
Widget buildCoolButtonUseCase(BuildContext context) {
  CardTCGBrief cardTCGBrief = CardTCGBrief(
      id: '??',
      image:
          'https://http2.mlstatic.com/D_NQ_NP_2X_897743-MLB70064563112_062023-F.webp',
      localId: '??',
      name: 'Gengar VMAX');
  return Material(
      child: CardTcgWidget(
    cardTCGBrief: cardTCGBrief,
    quality: CardImageQuality.empty,
  ));
}
