import 'package:flutter/material.dart';
import 'package:gengar_dex/sdk/Models/card_tcg.dart';

class AboutCardBox extends StatelessWidget {
  const AboutCardBox({super.key, required this.cardTCG});
  final CardTCG? cardTCG;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vida: ' + (cardTCG?.hp.toString() ?? '')),
          Text('Tipo: ' +
              (cardTCG?.types.toString() ?? '')
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
          Text('Fraqueza: ' +
              (cardTCG?.weaknesses.toString() ?? '')
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
          Text('Recuo: ' + (cardTCG?.retreat.toString() ?? ''))
        ],
      ),
    );
  }
}
