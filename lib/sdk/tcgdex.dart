import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gengar_dex/sdk/Models/card_tcg.dart';
import 'package:gengar_dex/sdk/Models/card_tcg_brief.dart';
import 'package:http/http.dart' as http;

class TCGDex {
  static const String _baseUrl = 'https://api.tcgdex.net/v2';

  http.Client client = http.Client();
  String urlGetCard = '$_baseUrl/pt/cards';
  String urlGetSetCards = '$_baseUrl/pt/sets';

  Future<CardTCG> getCard(String code) async {
    final response = await _get(Uri.parse(('$urlGetCard/$code')));
    return CardTCG.fromJson(json.decode(response.body));
  }

  Future<List<CardTCGBrief>> getSetCards(String code) async {
    final response = await _get(Uri.parse('$urlGetSetCards/$code'));
    List<dynamic> cards = json.decode(response.body)['cards'];
    return cards.map((card) => CardTCGBrief.fromJson(card)).toList();
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
