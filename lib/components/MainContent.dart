import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_shamil/models/Surah_Verses.dart';

import '../providers/SurahProvider.dart';
import '../screens/SurahView.dart';

class MainContent extends StatefulWidget {
   MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  Surah? surah;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadQuran();
  }
  loadQuran() {
    // Load and parse JSON data

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SurahPage(),
      ),
    );
  }
}
