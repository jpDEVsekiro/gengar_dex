import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gengar_dex/app/modules/home/store/sets_filter_store.dart';
import 'package:gengar_dex/app/modules/home/widgets/set_card.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';

class SetsFilterModal extends StatefulWidget {
  const SetsFilterModal({super.key, required this.listSets});
  final List<SetTcg> listSets;

  @override
  State<SetsFilterModal> createState() => _SetsFilterModalState();
}

class _SetsFilterModalState extends State<SetsFilterModal> {
  SetsFilterStore store = SetsFilterStore();
  List<SetTcg> get listSets => widget.listSets.reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          15,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sets',
                    style: TextStyle(fontSize: 20),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      cacheExtent: 0,
                      padding: const EdgeInsets.only(top: 8),
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
                              if (set1 != null)
                                Observer(builder: (context) {
                                  return SetCard(
                                      set: set1!,
                                      isSelect:
                                          store.selectedSet?.id == set1.id,
                                      onTap: () {
                                        store.setSelectedSet(set1!);
                                      });
                                }),
                              const SizedBox(width: 10),
                              if (set2 != null)
                                Observer(builder: (context) {
                                  return SetCard(
                                      set: set2!,
                                      isSelect:
                                          store.selectedSet?.id == set2.id,
                                      onTap: () {
                                        store.setSelectedSet(set2!);
                                      });
                                }),
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
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, store.selectedSet);
                  },
                  child: Text('Apply'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
