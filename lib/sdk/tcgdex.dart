import 'dart:convert';

import 'package:gengar_dex/sdk/Models/card_tcg.dart';
import 'package:http/http.dart' as http;

class TCGDex {
  static const String _baseUrl = 'https://api.tcgdex.net/v2';

  http.Client client = http.Client();
  String urlGetCard = '$_baseUrl/pt/cards';
  String urlGetSetCards = '$_baseUrl/pt/sets';

  Future<CardTCG> getCard(String code) async {
    final response = await client.get(Uri.parse(('$urlGetCard/$code')));
    return CardTCG.fromJson(json.decode(response.body));
  }

  Future<List<CardTCG>> getSetCards(String code) async {
    final response = await client.get(Uri.parse('$urlGetSetCards/$code'));
    List<dynamic> cards = json.decode(response.body)['cards'];
    return cards.map((card) => CardTCG.fromJson(card)).toList();
  }
}
