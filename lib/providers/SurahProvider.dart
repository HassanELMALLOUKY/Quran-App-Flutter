import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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

  Widget makeAyaSvg(){
    return SvgPicture.asset('assets/images/aya_1.svg',
      height: 40,width: 40,color: Colors.blueAccent,);
  }


  void fetchData(int surahIndex) async {
    final response = await rootBundle.loadString('assets/data/quran_ar.json');
    final List<dynamic> jsonData = json.decode(response);
    notifyListeners();
    _surah= Surah.fromJson(jsonData[surahIndex]);
  }


}