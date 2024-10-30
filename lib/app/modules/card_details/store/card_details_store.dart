import 'package:gengar_dex/sdk/Models/card_tcg.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/tcgdex.dart';
import 'package:mobx/mobx.dart';

part 'card_details_store.g.dart';

class CardDetailsStore = _CardDetailsBase with _$CardDetailsStore;

abstract class _CardDetailsBase with Store {
  TCGDex tcgDex = TCGDex();

  @observable
  CardTCG? cardTCG;

  @action
  init(CardTCGBrief cardTCGBrief) async {
    cardTCG = await tcgDex.getCard(cardTCGBrief.id!);
    tcgDex.getSets();
  }
}
