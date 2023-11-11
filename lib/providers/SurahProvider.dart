import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../models/Surah_Verses.dart';

class SurahProvider extends ChangeNotifier{

  Surah? surah;
  List<Surah?> listSurah=[];
  int indexSurah=0;

  void increment(int surahNumber) {
    indexSurah=surahNumber-1;
    notifyListeners();
  }
  void nextSurah(){
    if(indexSurah<114){
      indexSurah++;
      surah=listSurah[indexSurah];
      notifyListeners();
    }
  }


  void fetchData() async {
    final response = await rootBundle.loadString('assets/data/quran_ar.json');
    final List<dynamic> jsonData = json.decode(response);
    jsonData.forEach((element) {
      listSurah.add(Surah.fromJson(element));
    });
    notifyListeners();
  }

  void fetchSurah(int surahNumber) {
    surah=listSurah[surahNumber];
    notifyListeners();
  }


}