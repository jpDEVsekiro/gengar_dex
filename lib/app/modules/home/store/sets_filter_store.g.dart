// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sets_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetsFilterStore on _SetsFilterStoreBase, Store {
  late final _$selectedSetAtom =
      Atom(name: '_SetsFilterStoreBase.selectedSet', context: context);

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

  late final _$_SetsFilterStoreBaseActionController =
      ActionController(name: '_SetsFilterStoreBase', context: context);

  @override
  void setSelectedSet(SetTcg value) {
    final _$actionInfo = _$_SetsFilterStoreBaseActionController.startAction(
        name: '_SetsFilterStoreBase.setSelectedSet');
    try {
      return super.setSelectedSet(value);
    } finally {
      _$_SetsFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSet: ${selectedSet}
    ''';
  }
}
