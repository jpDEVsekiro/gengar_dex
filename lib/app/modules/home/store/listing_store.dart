import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/tcgdex.dart';
import 'package:mobx/mobx.dart';

part 'listing_store.g.dart';

class ListingStore = _ListingStoreBase with _$ListingStore;

abstract class _ListingStoreBase with Store {
  @observable
  ObservableList<CardTCGBrief> listCards = ObservableList<CardTCGBrief>();

  TCGDex sdk = TCGDex();

  @action
  void setList(List<CardTCGBrief> value) {
    listCards.clear();
    listCards.addAll(value);
  }

  init() async {
    List<CardTCGBrief> values = await sdk.getSetCards('sv06');
    setList(values);
  }
}
