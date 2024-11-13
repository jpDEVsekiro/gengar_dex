// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListingStore on _ListingStoreBase, Store {
  late final _$listCardsAtom =
      Atom(name: '_ListingStoreBase.listCards', context: context);

  @override
  ObservableList<CardTCGBrief> get listCards {
    _$listCardsAtom.reportRead();
    return super.listCards;
  }

  @override
  set listCards(ObservableList<CardTCGBrief> value) {
    _$listCardsAtom.reportWrite(value, super.listCards, () {
      super.listCards = value;
    });
  }

  late final _$listSetsAtom =
      Atom(name: '_ListingStoreBase.listSets', context: context);

  @override
  ObservableList<SetTcg> get listSets {
    _$listSetsAtom.reportRead();
    return super.listSets;
  }

  @override
  set listSets(ObservableList<SetTcg> value) {
    _$listSetsAtom.reportWrite(value, super.listSets, () {
      super.listSets = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_ListingStoreBase.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$selectedSetAtom =
      Atom(name: '_ListingStoreBase.selectedSet', context: context);

  @override
  SetTcg? get selectedSet {
    _$selectedSetAtom.reportRead();
    return super.selectedSet;
  }

  @override
  set selectedSet(SetTcg? value) {
    _$selectedSetAtom.reportWrite(value, super.selectedSet, () {
      super.selectedSet = value;
    });
  }

  late final _$setSelectedSetAsyncAction =
      AsyncAction('_ListingStoreBase.setSelectedSet', context: context);

  @override
  Future<void> setSelectedSet(SetTcg? value) {
    return _$setSelectedSetAsyncAction.run(() => super.setSelectedSet(value));
  }

  late final _$searchCardsAsyncAction =
      AsyncAction('_ListingStoreBase.searchCards', context: context);

  @override
  Future<void> searchCards(String value) {
    return _$searchCardsAsyncAction.run(() => super.searchCards(value));
  }

  late final _$_ListingStoreBaseActionController =
      ActionController(name: '_ListingStoreBase', context: context);

  @override
  void addListCardsValue(List<CardTCGBrief> value) {
    final _$actionInfo = _$_ListingStoreBaseActionController.startAction(
        name: '_ListingStoreBase.addListCardsValue');
    try {
      return super.addListCardsValue(value);
    } finally {
      _$_ListingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListSetValue(List<SetTcg> value) {
    final _$actionInfo = _$_ListingStoreBaseActionController.startAction(
        name: '_ListingStoreBase.addListSetValue');
    try {
      return super.addListSetValue(value);
    } finally {
      _$_ListingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCards: ${listCards},
listSets: ${listSets},
searchText: ${searchText},
selectedSet: ${selectedSet}
    ''';
  }
}
