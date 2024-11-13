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
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + 15,
        ),
        TextField(
          controller: store.searchController,
          onChanged: (value) {
            store.searchCards(value);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Observer(builder: (context) {
              if (store.searchText.trim() == '')
                return SizedBox(
                  height: 0,
                  width: 0,
                );
              return InkWell(
                onTap: () {
                  store.searchController.clear();
                  store.searchCards('');
                },
                child: Icon(
                  Icons.clear,
                ),
              );
            }),
            hintText: 'Search',
            hintStyle:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(),
          ),
        ),
        InkWell(
          onTap: () async {
            store.setSelectedSet(await showMaterialModalBottomSheet(
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
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.menu_rounded),
                const SizedBox(width: 5),
                Observer(builder: (context) {
                  return Text(store.selectedSet?.name ?? 'Sets');
                }),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
        Observer(builder: (context) {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
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
                  return Row(
                    children: [
                      if (card1 != null)
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      CardDetailsPage(cardTCGBrief: card1!)));
                            },
                            child: CardTcgWidget(cardTCGBrief: card1)),
                      const SizedBox(width: 8),
                      if (card2 != null)
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      CardDetailsPage(cardTCGBrief: card2!)));
                            },
                            child: CardTcgWidget(cardTCGBrief: card2)),
                    ],
                  );
                }),
          );
        })
      ]),
    ));
  }
}
