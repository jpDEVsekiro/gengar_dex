import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/modules/home/store/listing_store.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:shimmer/shimmer.dart';

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
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2 - 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.sizeOf(context).width / 2 - 5,
                            child: CachedNetworkImage(
                              imageUrl: '${card1.image}/low.webp',
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.transparent,
                                highlightColor: Colors.black12,
                                child: Container(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Text(card1.name ?? ''),
                          Text(card1.id ?? ''),
                          Text(card1.localId ?? ''),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2 - 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.sizeOf(context).width / 2 - 5,
                            child: CachedNetworkImage(
                              imageUrl: '${card2.image}/low.webp',
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.transparent,
                                highlightColor: Colors.black12,
                                child: Container(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Text(card2.name ?? ''),
                          Text(card2.id ?? ''),
                          Text(card2.localId ?? ''),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        );
      })
    ]));
  }
}
