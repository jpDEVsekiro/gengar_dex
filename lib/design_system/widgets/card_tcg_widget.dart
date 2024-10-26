import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/enums/card_image_quality.dart';
import 'package:shimmer/shimmer.dart';

class CardTcgWidget extends StatelessWidget {
  const CardTcgWidget(
      {super.key,
      required this.cardTCGBrief,
      this.quality = CardImageQuality.high});
  final CardTCGBrief cardTCGBrief;
  final CardImageQuality quality;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width / 2) - 13,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.sizeOf(context).width / 1.5),
            child: CachedNetworkImage(
              imageUrl: '${(cardTCGBrief.image ?? '') + quality.toString()}',
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
          Text(cardTCGBrief.name ?? ''),
          Text(cardTCGBrief.id ?? ''),
          Text(cardTCGBrief.localId ?? ''),
        ],
      ),
    );
  }
}
