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
listSets: ${listSets}
    ''';
  }
}
