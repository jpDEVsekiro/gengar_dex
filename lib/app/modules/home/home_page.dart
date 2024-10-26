import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/modules/home/store/listing_store.dart';
import 'package:gengar_dex/design_system/widgets/card_tcg_widget.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListingStore store = ListingStore();
  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Observer(builder: (context) {
        return Expanded(
          child: ListView.builder(
              cacheExtent: 0,
              itemCount: (store.listCards.length / 2).ceil(),
              itemBuilder: (context, index) {
                CardTCGBrief card1;
                CardTCGBrief card2;
                if (index == 0) {
                  card1 = store.listCards[0];
                  card2 = store.listCards[1];
                } else {
                  card1 = store.listCards[index * 2];
                  card2 = store.listCards[index * 2 + 1];
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      CardTcgWidget(cardTCGBrief: card1),
                      const SizedBox(width: 10),
                      CardTcgWidget(cardTCGBrief: card2),
                    ],
                  ),
                );
              }),
        );
      })
    ]));
  }
}
