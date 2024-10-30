class CardTCG {
  final String? category;
  final String? id;
  final String? illustrator;
  final String? image;
  final String? localId;
  final String? name;
  final String? rarity;
  final Set? set;
  final Variants? variants;
  final int? hp;
  final List<String>? types;
  final String? evolveFrom;
  final String? description;
  final String? stage;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final int? retreat;
  final String? regulationMark;
  final Legal? legal;

  CardTCG({
    this.category,
    this.id,
    this.illustrator,
    this.image,
    this.localId,
    this.name,
    this.rarity,
    this.set,
    this.variants,
    this.hp,
    this.types,
    this.evolveFrom,
    this.description,
    this.stage,
    this.attacks,
    this.weaknesses,
    this.retreat,
    this.regulationMark,
    this.legal,
  });

  factory CardTCG.fromJson(Map<String, dynamic> json) {
    return CardTCG(
      category: json['category'],
      id: json['id'],
      illustrator: json['illustrator'],
      image: json['image'],
      localId: json['localId'],
      name: json['name'],
      rarity: json['rarity'],
      set: json['set'] == null ? null : Set.fromJson(json['set']),
      variants:
          json['variants'] == null ? null : Variants.fromJson(json['variants']),
      hp: json['hp'],
      types: json['types'] == null ? null : List<String>.from(json['types']),
      evolveFrom: json['evolveFrom'],
      description: json['description'],
      stage: json['stage'],
      attacks: json['attacks'] == null
          ? null
          : (json['attacks'] as List).map((i) => Attack.fromJson(i)).toList(),
      weaknesses: json['weaknesses'] == null
          ? null
          : (json['weaknesses'] as List)
              .map((i) => Weakness.fromJson(i))
              .toList(),
      retreat: json['retreat'],
      regulationMark: json['regulationMark'],
      legal: json['legal'] == null ? null : Legal.fromJson(json['legal']),
    );
  }
}

class Set {
  final CardCount? cardCount;
  final String? id;
  final String? logo;
  final String? name;
  final String? symbol;

  Set({
    this.cardCount,
    this.id,
    this.logo,
    this.name,
    this.symbol,
  });

  factory Set.fromJson(Map<String, dynamic> json) {
    return Set(
      cardCount: CardCount.fromJson(json['cardCount']),
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }
}

class CardCount {
  final int? official;
  final int? total;

  CardCount({
    this.official,
    this.total,
  });

  factory CardCount.fromJson(Map<String, dynamic> json) {
    return CardCount(
      official: json['official'],
      total: json['total'],
    );
  }
}

class Variants {
  final bool? firstEdition;
  final bool? holo;
  final bool? normal;
  final bool? reverse;
  final bool? wPromo;

  Variants({
    this.firstEdition,
    this.holo,
    this.normal,
    this.reverse,
    this.wPromo,
  });

  factory Variants.fromJson(Map<String, dynamic> json) {
    return Variants(
      firstEdition: json['firstEdition'],
      holo: json['holo'],
      normal: json['normal'],
      reverse: json['reverse'],
      wPromo: json['wPromo'],
    );
  }
}

class Attack {
  final List<String>? cost;
  final String? name;
  final String? effect;
  final dynamic damage;

  Attack({
    this.cost,
    this.name,
    this.effect,
    this.damage,
  });

  factory Attack.fromJson(Map<String, dynamic> json) {
    return Attack(
      cost: List<String>.from(json['cost']),
      name: json['name'],
      effect: json['effect'],
      damage: json['damage'],
    );
  }
}

class Weakness {
  final String? type;
  final String? value;

  Weakness({
    this.type,
    this.value,
  });

  factory Weakness.fromJson(Map<String, dynamic> json) {
    return Weakness(
      type: json['type'],
      value: json['value'],
    );
  }
}

class Legal {
  final bool? standard;
  final bool? expanded;

  Legal({
    this.standard,
    this.expanded,
  });

  factory Legal.fromJson(Map<String, dynamic> json) {
    return Legal(
      standard: json['standard'],
      expanded: json['expanded'],
    );
  }
}
