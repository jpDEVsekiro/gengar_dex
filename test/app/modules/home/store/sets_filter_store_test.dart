import 'package:gengar_dex/app/modules/home/store/listing_store.dart';
import 'package:gengar_dex/app/modules/home/store/sets_filter_store.dart';
import 'package:test/test.dart';

void main() {
  SetsFilterStore store = SetsFilterStore();
  ListingStore listingStore = ListingStore();
  test('Test SetsFilterStore.setSelectedSet', () async {
    await listingStore.init();
    listingStore.init();
    store.setSelectedSet(listingStore.listSets.last);
    expect(store.selectedSet, equals(listingStore.listSets.last));
  });
}
