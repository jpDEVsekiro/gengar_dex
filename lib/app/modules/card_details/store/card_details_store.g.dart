// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardDetailsStore on _CardDetailsBase, Store {
  late final _$cardTCGAtom =
      Atom(name: '_CardDetailsBase.cardTCG', context: context);

  @override
  CardTCG? get cardTCG {
    _$cardTCGAtom.reportRead();
    return super.cardTCG;
  }

  @override
  set cardTCG(CardTCG? value) {
    _$cardTCGAtom.reportWrite(value, super.cardTCG, () {
      super.cardTCG = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_CardDetailsBase.init', context: context);

  @override
  Future init(CardTCGBrief cardTCGBrief) {
    return _$initAsyncAction.run(() => super.init(cardTCGBrief));
  }

  @override
  String toString() {
    return '''
cardTCG: ${cardTCG}
    ''';
  }
}
