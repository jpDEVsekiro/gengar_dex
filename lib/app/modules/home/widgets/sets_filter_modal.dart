import 'package:flutter/material.dart';
import 'package:gengar_dex/app/modules/home/widgets/set_card.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';

class SetsFilterModal extends StatelessWidget {
  const SetsFilterModal({super.key, required this.listSets});
  final List<SetTcg> listSets;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sets',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                cacheExtent: 0,
                itemCount: (listSets.length / 2).ceil(),
                physics: NeverScrollableScrollPhysics(),
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
                        if (set1 != null) SetCard(set: set1),
                        const SizedBox(width: 10),
                        if (set2 != null) SetCard(set: set2),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
