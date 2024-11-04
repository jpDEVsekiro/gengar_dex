import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:shimmer/shimmer.dart';

class SetsFilterModal extends StatelessWidget {
  const SetsFilterModal({super.key, required this.listSets});
  final List<SetTcg> listSets;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sets',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  cacheExtent: 0,
                  itemCount: (listSets.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    SetTcg? set1;
                    SetTcg? set2;
                    if (index == 0) {
                      set1 = listSets[0];
                      set2 = listSets[1];
                    } else {
                      set1 = listSets.elementAtOrNull(index * 2);
                      set2 = listSets.elementAtOrNull(index * 2 + 1);
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          if (set1 != null)
                            SizedBox(
                              width:
                                  (MediaQuery.sizeOf(context).width / 2) - 13,
                              child: InkWell(
                                onTap: () {},
                                child: CachedNetworkImage(
                                  imageUrl: '${(set1.logo ?? '')}.webp',
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
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
                          const SizedBox(width: 10),
                          if (set2 != null)
                            SizedBox(
                              width:
                                  (MediaQuery.sizeOf(context).width / 2) - 13,
                              child: InkWell(
                                onTap: () {},
                                child: CachedNetworkImage(
                                  imageUrl: '${(set2.logo ?? '')}.webp',
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
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
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
