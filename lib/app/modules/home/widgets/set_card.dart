import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    return Container(
      width: (MediaQuery.sizeOf(context).width / 2) - 13,
      color: isSelect ? Colors.grey[300] : Colors.transparent,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: CachedNetworkImage(
              imageUrl: '${(set.logo ?? '')}.webp',
              height: (MediaQuery.sizeOf(context).width / 3),
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
          Text(set.name)
        ],
      ),
    );
  }
}
