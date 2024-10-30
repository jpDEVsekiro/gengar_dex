import 'package:gengar_dex/sdk/Models/card_tcg.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:gengar_dex/sdk/tcgdex.dart';
import 'package:test/test.dart';

void main() {
  TCGDex sdk = TCGDex();
  test('Test sdk.getSetCards', () async {
    List set = await sdk.getSetCards('sv05');
    expect(set.isNotEmpty, equals(true));
    expect(set.first.id, equals('sv05-001'));
  });

  test('Test sdk.getCard', () async {
    CardTCG cardTCG = await sdk.getCard('sv05-001');
    expect(cardTCG.id, equals('sv05-001'));
    expect(cardTCG.hp, equals(90));
  });

  test('Test sdk.getSets', () async {
    List<SetTcg> sets = await sdk.getSets();
    expect(sets.first.id, equals('base1'));
    expect(sets.any((set) => set.name == 'Coroa Estelar'), equals(true));
  });
}
