import 'package:flutter/material.dart';
import 'package:gengar_dex/sdk/tcgdex.dart';

import '../../../sdk/Models/card_tcg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    CardTCG card = await TCGDex().getCard('swsh3-136');
    print(card.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text('Hello, World!'),
    ]));
  }
}
