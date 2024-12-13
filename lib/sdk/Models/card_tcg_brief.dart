import 'package:objectbox/objectbox.dart';

@Entity()
class CardTCGBrief {
  @Id()
  int? obxId;
  final String? id;
  final String? localId;
  final String? name;
  String? image;

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
