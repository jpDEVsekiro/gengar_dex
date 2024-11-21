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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: (MediaQuery.sizeOf(context).width / 2) - 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFC8FFBF).withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${cardTCGBrief.localId ?? ''} - ${cardTCGBrief.name ?? ''}',
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Hero(
                tag: cardTCGBrief.id ?? '',
                child: Container(
                  height: (MediaQuery.sizeOf(context).width / 1.8),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl:
                        '${(cardTCGBrief.image ?? '') + quality.toString()}',
                    placeholder: (context, url) => SizedBox(
                      height: (MediaQuery.sizeOf(context).width / 1.7),
                      child: Shimmer.fromColors(
                        baseColor: Colors.transparent,
                        highlightColor: Colors.black12,
                        child: Container(
                          color: Colors.grey[300]!,
                        ),
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
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
