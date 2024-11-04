import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/design_system/widgets/card_tcg_widget.dart';
import 'package:gengar_dex/app/modules/card_details/card_details_page.dart';
import 'package:gengar_dex/app/modules/home/store/listing_store.dart';
import 'package:gengar_dex/app/modules/home/widgets/sets_filter_modal.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        InkWell(
          onTap: () {
            showMaterialModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              builder: (context) => SetsFilterModal(
                listSets: store.listSets,
              ),
            );
          },
          child: Icon(Icons.filter_alt),
        ),
        Observer(builder: (context) {
          return ListView.builder(
              shrinkWrap: true,
              cacheExtent: 0,
              physics: NeverScrollableScrollPhysics(),
              itemCount: (store.listCards.length / 2).ceil(),
              itemBuilder: (context, index) {
                CardTCGBrief? card1;
                CardTCGBrief? card2;
                if (index == 0) {
                  card1 = store.listCards[0];
                  card2 = store.listCards[1];
                } else {
                  card1 = store.listCards.elementAtOrNull(index * 2);
                  card2 = store.listCards.elementAtOrNull(index * 2 + 1);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      if (card1 != null)
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      CardDetailsPage(cardTCGBrief: card1!)));
                            },
                            child: CardTcgWidget(cardTCGBrief: card1)),
                      const SizedBox(width: 10),
                      if (card2 != null)
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      CardDetailsPage(cardTCGBrief: card2!)));
                            },
                            child: CardTcgWidget(cardTCGBrief: card2)),
                    ],
                  ),
                );
              });
        })
      ]),
    ));
  }
}
