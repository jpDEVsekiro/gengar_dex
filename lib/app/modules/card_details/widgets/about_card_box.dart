import 'package:flutter/material.dart';
import 'package:gengar_dex/sdk/Models/card_tcg.dart';

class AboutCardBox extends StatelessWidget {
  const AboutCardBox({super.key, required this.cardTCG});
  final CardTCG? cardTCG;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Text(cardTCG?.hp.toString() ?? ''),
        Text(cardTCG?.id.toString() ?? ''),
        Text(cardTCG?.category.toString() ?? ''),
        Text(cardTCG?.description.toString() ?? ''),
        Text(cardTCG?.illustrator.toString() ?? ''),
        Text(cardTCG?.types.toString() ?? ''),
        Text(cardTCG?.weaknesses.toString() ?? ''),
      ],
    );
  }
}
