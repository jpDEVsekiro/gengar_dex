import 'package:flutter/material.dart';
import 'package:gengar_dex/design_system/widgets/card_tcg_widget.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CardTcgWidget)
Widget buildCoolButtonUseCase(BuildContext context) {
  CardTCGBrief cardTCGBrief = CardTCGBrief(
      id: 'sv06-214',
      image:
          'https://www.hubspot.com/hs-fs/hubfs/parts-url_0.webp?width=650&height=396&name=parts-url_0.webp',
      localId: '214',
      name: 'Greninja ex');
  return Material(
      child: SizedBox(
          width: 200, child: CardTcgWidget(cardTCGBrief: cardTCGBrief)));
}
