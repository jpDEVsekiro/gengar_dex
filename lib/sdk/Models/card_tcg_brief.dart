class CardTCGBrief {
  final String? id;
  final String? localId;
  final String? name;
  final String? image;

  CardTCGBrief({
    this.id,
    this.localId,
    this.name,
    this.image,
  });

  factory CardTCGBrief.fromJson(Map<String, dynamic> json) {
    return CardTCGBrief(
      id: json['id'],
      localId: json['localId'],
      name: json['name'],
      image: json['image'],
    );
  }
}
