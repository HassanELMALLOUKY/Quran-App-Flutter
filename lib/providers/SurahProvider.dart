import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/Surah_Verses.dart';

class SurahProvider extends ChangeNotifier{

  Surah? _surah;


  Surah? get surah => _surah;

  Future<Surah?> getSurah(int surahNumber) async {
    try {
      final String response = await rootBundle.loadString('assets/data/quran_ar.json');
      final List<dynamic> jsonData = json.decode(response);

      if (jsonData.isNotEmpty) {
        Surah surah = Surah.fromJson(jsonData[surahNumber]);
        print(surah.name);
        return surah;
      } else {
        print('JSON data is empty.');
        return null;
      }
    } catch (e) {
      return null;
    }
    finally{
       notifyListeners();
    }
  }

  Surah getSurah2(){
    Surah surah;
    // Load and parse JSON data
    String jsonString = '{"id":1,"name":"الفاتحة","transliteration":"Al-Fatihah","type":"meccan","total_verses":7,"verses":[{"id":1,"text":"بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ"},{"id":2,"text":"ٱلۡحَمۡدُ لِلَّهِ رَبِّ ٱلۡعَٰلَمِينَ"},{"id":3,"text":"ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ"},{"id":4,"text":"مَٰلِكِ يَوۡمِ ٱلدِّينِ"},{"id":5,"text":"إِيَّاكَ نَعۡبُدُ وَإِيَّاكَ نَسۡتَعِينُ"},{"id":6,"text":"ٱهۡدِنَا ٱلصِّرَٰطَ ٱلۡمُسۡتَقِيمَ"},{"id":7,"text":"صِرَٰطَ ٱلَّذِينَ أَنۡعَمۡتَ عَلَيۡهِمۡ غَيۡرِ ٱلۡمَغۡضُوبِ عَلَيۡهِمۡ وَلَا ٱلضَّآلِّينَ"}]}';
    Map<String, dynamic> json = jsonDecode(jsonString);
    surah = Surah(
      id: json['id'],
      name: json['name'],
      transliteration: json['transliteration'],
      type: json['type'],
      totalVerses: json['total_verses'],
      verses: (json['verses'] as List).map((v) {
        return Verses(id: v['id'], text: v['text']);
      }).toList(),
    );
    print(surah.verses[0].text);
    notifyListeners();
    return surah;
  }


  void fetchData(int surahIndex) async {
    final response = await rootBundle.loadString('assets/data/quran_ar.json');
    final List<dynamic> jsonData = json.decode(response);
    notifyListeners();
    _surah= Surah.fromJson(jsonData[surahIndex]);
  }


}