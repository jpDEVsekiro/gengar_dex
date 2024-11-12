import 'package:flutter/cupertino.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:gengar_dex/sdk/tcgdex.dart';
import 'package:mobx/mobx.dart';

part 'listing_store.g.dart';

class ListingStore = _ListingStoreBase with _$ListingStore;

abstract class _ListingStoreBase with Store {
  @observable
  ObservableList<CardTCGBrief> listCards = ObservableList<CardTCGBrief>();

  @observable
  ObservableList<SetTcg> listSets = ObservableList<SetTcg>();

  @observable
  String searchText = '';

  TextEditingController searchController = TextEditingController();

  SetTcg? selectedSet;

  TCGDex sdk = TCGDex();

  @action
  void addListCardsValue(List<CardTCGBrief> value) {
    listCards.clear();
    listCards.addAll(value);
  }

  @action
  void addListSetValue(List<SetTcg> value) {
    listSets.clear();
    listSets.addAll(value);
  }

  init() async {
    List<SetTcg> valuesSets = await sdk.getSets();
    List<CardTCGBrief> valuesCards =
        await sdk.getSetCards(selectedSet?.id ?? valuesSets.last.id);
    addListSetValue(valuesSets);
    addListCardsValue(valuesCards);
  }

  @action
  Future<void> setSelectedSet(SetTcg? value) async {
    if (selectedSet?.id == value?.id) {
      return;
    }
    selectedSet = value;
    await init();
  }

  @action
  Future<void> searchCards(String value) async {
    searchText = value;
    await Future.delayed(Duration(milliseconds: 500));
    if (value != searchController.text) return;
    if (value.isEmpty) {
      init();
      return;
    }
    selectedSet = null;
    List<CardTCGBrief> result = await sdk.searchCards(searchController.text);
    selectedSet = null;
    addListCardsValue(result);
  }
}
