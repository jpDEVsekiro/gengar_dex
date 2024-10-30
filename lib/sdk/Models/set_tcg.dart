class SetTcg {
  final String id;
  final String? logo;
  final int? cardTotal;
  final String name;

  SetTcg({required this.id, this.logo, required this.name, this.cardTotal});

  factory SetTcg.fromJson(Map<String, dynamic> json) {
    return SetTcg(
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      cardTotal: json['cardCount']?['total'],
    );
  }
}
