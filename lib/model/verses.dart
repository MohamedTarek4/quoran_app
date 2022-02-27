class SurahVerses {
  int? id;
  String? name;
  String? type;
  int? totalVerses;
  List<Verses>? verses;

  SurahVerses({
    required this.id,
    required this.name,
    required this.type,
    required this.totalVerses,
    required this.verses,
  });

  SurahVerses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    totalVerses = json['total_verses'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }
}

class Verses {
  int? id;
  String? text;

  Verses({
  required  this.id,
  required  this.text,
  });

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
}
