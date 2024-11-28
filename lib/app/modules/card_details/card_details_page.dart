import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/design_system/palette.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardTCGBrief.name.toString() ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Palette.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 15,
                left: MediaQuery.of(context).size.width * 0.08,
                right: MediaQuery.of(context).size.width * 0.08,
                bottom: 20),
            child: Hero(
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
          ),
          Observer(builder: (context) {
            return AboutCardBox(cardTCG: store.cardTCG);
          })
        ],
      ),
    );
  }
}
