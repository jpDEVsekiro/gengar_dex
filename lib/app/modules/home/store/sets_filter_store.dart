import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:mobx/mobx.dart';

part 'sets_filter_store.g.dart';

class SetsFilterStore = _SetsFilterStoreBase with _$SetsFilterStore;

abstract class _SetsFilterStoreBase with Store {
  @observable
  SetTcg? selectedSet;

  @action
  void setSelectedSet(SetTcg value) {
    if (selectedSet?.id == value.id) {
      selectedSet = null;
      return;
    }
    selectedSet = value;
  }
}
