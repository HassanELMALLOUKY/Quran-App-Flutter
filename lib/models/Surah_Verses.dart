import 'package:json_annotation/json_annotation.dart';


class Surah {
  final int id;
  final String name;
  final String transliteration;
  final String type;
  final int totalVerses;
  final List<Verses> verses;

  Surah({
    required this.id,
    required this.name,
    required this.transliteration,
    required this.type,
    required this.totalVerses,
    required this.verses,
  });
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['id'],
      name: json['name'],
      transliteration: json['transliteration'],
      type: json['type'],
      totalVerses: json['total_verses'],
      verses: (json['verses'] as List).map((v) {
        return Verses(id: v['id'], text: v['text']);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'transliteration': transliteration,
      'type': type,
      'total_verses': totalVerses,
      'verses': verses.map((v) => v.toJson()).toList(),
    };
  }
}

class Verses {
  final int id;
  final String text;

  Verses({required this.id, required this.text});

  factory Verses.fromJson(Map<String, dynamic> json) {
   return Verses(
       id: json['id'],
       text: json['text']
   );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text':text
    };
  }

}
