import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_shamil/providers/SurahProvider.dart';

import '../models/Surah_Verses.dart';

class SurahPage extends StatelessWidget {
  Surah? surah;

  void getSurah2(BuildContext context,int surahIndex) async {
    context.watch<SurahProvider>().fetchData(surahIndex);
    surah=context.watch<SurahProvider>().surah;
  }
  @override
  Widget build(BuildContext context) {
    getSurah2(context,80);
    return surah!=null? Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              minimum: const EdgeInsets.all(15),
              child: ListView(children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: header()
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      for (var i = 0; i < surah!.verses.length; i++) ...{
                        TextSpan(
                          text: ' ${surah?.verses[i].text} ',
                          style: const TextStyle(
                            fontFamily: 'MADDINA',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Stack(
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset('assets/images/aya_1.svg',
                                    height: 40,width: 40,color: Colors.blueAccent,),
                                onTap: (){
                                  print("I pressed on Aya ${surah?.verses[i].id}");
                                },
                              ),
                              SizedBox(
                                height: 40,
                                width: 30,
                                child: Center(
                                    child: Text(
                                      "${surah?.verses[i].id}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )),
                              )
                            ],
                          ),
                        ),
                      }
                    ],
                  ),
                ),

              ]),
            ),
          ),
        ):const CircularProgressIndicator();

  }

  Center header() {
    return Center(
      child: Text(
        "${surah?.name}",
        style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500),
      )
    );

  }
}
