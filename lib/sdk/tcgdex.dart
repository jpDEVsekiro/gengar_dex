import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:gengar_dex/sdk/Models/card_tcg.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:gengar_dex/sdk/Models/set_tcg.dart';
import 'package:http/http.dart' as http;

class TCGDex {
  static const String _baseUrl = 'https://api.tcgdex.net/v2';

  http.Client client = http.Client();
  static const _urlGetCardPT = '$_baseUrl/pt/cards';
  static const _urlGetSetCardsPT = '$_baseUrl/pt/sets';

  static const _urlGetCardEN = '$_baseUrl/en/cards';
  static const _urlGetSetCardsEN = '$_baseUrl/en/sets';

  Future<CardTCG> getCard(String code) async {
    final response = await _get(Uri.parse(('$_urlGetCardPT/$code')));
    final responseEN = await _get(Uri.parse(('$_urlGetCardEN/$code')));
    Map<String, dynamic> map = json.decode(response.body);
    Map<String, dynamic> mapEN = json.decode(responseEN.body);
    for (String key in mapEN.keys) {
      if (map.containsKey(key) == false) {
        map[key] = mapEN[key];
      } else if (map[key] == null) {
        map[key] = mapEN[key];
      }
    }
    CardTCG cardTCG = CardTCG.fromJson(map);
    return cardTCG;
  }

  Future<List<CardTCGBrief>> getSetCards(String code) async {
    final response = await _get(Uri.parse('$_urlGetSetCardsEN/$code'));
    final responsePT = await _get(Uri.parse('$_urlGetSetCardsPT/$code'));
    List<dynamic> cards = json.decode(response.body)['cards'];
    List<CardTCGBrief> value =
        cards.map((card) => CardTCGBrief.fromJson(card)).toList();
    List<dynamic> cardsPT = json.decode(responsePT.body)['cards'];
    List<CardTCGBrief> valuePT =
        cardsPT.map((card) => CardTCGBrief.fromJson(card)).toList();
    for (int i = 0; i < value.length; i++) {
      CardTCGBrief? card =
          valuePT.firstWhereOrNull((test) => test.id == value[i].id);
      if (card != null && card.image != null) value[i] = card;
    }
    value.removeWhere((element) => element.image == null);
    return value;
  }

  Future<List<SetTcg>> getSets() async {
    final responsePT = await _get(Uri.parse('$_urlGetSetCardsPT'));
    final responseEN = await _get(Uri.parse('$_urlGetSetCardsEN'));
    List bodyPT = json.decode(responsePT.body);
    List bodyEN = json.decode(responseEN.body);
    List<SetTcg> sets = [];
    for (dynamic setJson in bodyPT) {
      SetTcg set = SetTcg.fromJson(setJson);
      if (set.logo == null) {
        set.logo =
            bodyEN.firstWhere((element) => element['id'] == set.id)['logo'];
      }
      sets.add(set);
    }
    sets.removeWhere((set) => set.logo == null);
    return sets;
  }

  Future<List<CardTCGBrief>> searchCards(String search) async {
    final response = await _get(Uri.parse('$_urlGetCardEN?name=$search'));
    List<dynamic> cards = json.decode(response.body);
    List<CardTCGBrief> value =
        cards.map((card) => CardTCGBrief.fromJson(card)).toList();
    value.removeWhere((element) => element.image == null);
    return value;
  }

  Future<http.Response> _get(Uri uri) async {
    DateTime now = DateTime.now();
    http.Response response = await client.get(uri);

    if (kDebugMode) {
      print(
          '--------------------------------------------------------------------------------------------');
      print(
          'GET ${uri.toString()} statusCode:${response.statusCode} time:${DateTime.now().difference(now).inSeconds}Seg');
      print(
          '--------------------------------------------------------------------------------------------');
    }
    return response;
  }
}
