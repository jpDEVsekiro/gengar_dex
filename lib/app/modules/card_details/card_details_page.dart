import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/modules/card_details/store/card_details_store.dart';
import 'package:gengar_dex/app/modules/card_details/widgets/about_card_box.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/enums/card_image_quality.dart';
import 'package:shimmer/shimmer.dart';

class CardDetailsPage extends StatefulWidget {
  const CardDetailsPage({super.key, required this.cardTCGBrief});
  final CardTCGBrief cardTCGBrief;

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  CardDetailsStore store = CardDetailsStore();
  CardTCGBrief get cardTCGBrief => widget.cardTCGBrief;

  @override
  void initState() {
    super.initState();
    store.init(cardTCGBrief);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: cardTCGBrief.id ?? '',
            child: CachedNetworkImage(
              imageUrl:
                  '${(cardTCGBrief.image ?? '') + CardImageQuality.high.toString()}',
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: Colors.black12,
                child: Container(
                  color: Colors.grey[300]!,
                ),
              ),
              errorWidget: (context, url, error) {
                print(url);
                print(error);
                return const Icon(Icons.error);
              },
            ),
          ),
          Observer(builder: (context) {
            return AboutCardBox(cardTCG: store.cardTCG);
          })
        ],
      ),
    );
  }
}
