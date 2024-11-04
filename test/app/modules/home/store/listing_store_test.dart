import 'package:gengar_dex/app/modules/home/store/listing_store.dart';
import 'package:test/test.dart';

void main() {
  ListingStore store = ListingStore();
  test('Test ListingStore.init', () async {
    await store.init();
    expect(store.listCards.isNotEmpty, equals(true));
    expect(store.listSets.isNotEmpty, equals(true));
    expect(store.listSets.first.id, equals('base1'));
    expect(store.listCards.first.id?.contains(store.listSets.last.id),
        equals(true));
  });
}
