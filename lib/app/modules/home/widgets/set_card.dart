import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gengar_dex/app/design_system/palette.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:shimmer/shimmer.dart';

class SetCard extends StatelessWidget {
  const SetCard(
      {super.key, required this.set, this.onTap, required this.isSelect});
  final SetTcg set;
  final void Function()? onTap;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: (MediaQuery.sizeOf(context).width / 2) - 13,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelect ? Palette.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            if (isSelect)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: '${(set.logo ?? '')}.webp',
              height: (MediaQuery.sizeOf(context).width / 3.35),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: Colors.black12,
                child: Container(
                  color: Palette.primary,
                ),
              ),
              errorWidget: (context, url, error) {
                print(url);
                print(error);
                return const Icon(Icons.error);
              },
            ),
            Text(
              set.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: isSelect ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
