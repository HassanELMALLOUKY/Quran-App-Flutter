import 'dart:convert';

import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_shamil/providers/SurahProvider.dart';

import '../models/Surah_Verses.dart';
import 'DialogScreen.dart';

class SurahPage extends StatelessWidget {
  Surah? surah;

  void getSurah2(BuildContext context,int surahIndex) async {
    context.watch<SurahProvider>().fetchData(surahIndex);
    surah=context.watch<SurahProvider>().surah;
  }
  @override
  Widget build(BuildContext context) {
    getSurah2(context,0);
    Size size=MediaQuery.sizeOf(context);
    return surah!=null? Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              minimum: const EdgeInsets.all(8),
              child: Column(
                children: [
                  header(context),
                  Expanded(
                    child: ListView(
                        children: [
                      SvgPicture.asset("assets/images/Basmala.svg",height: size.height/20,width: size.width,fit: BoxFit.scaleDown),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            for (var i = 0; i < surah!.verses.length; i++) ...{
                              TextSpan(
                                text: ' ${surah?.verses[i].text} ',
                                style: const TextStyle(
                                  fontFamily: 'AlQalam',
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: InkWell(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset('assets/images/aya_1.svg',
                                              height: size.height/22,width: size.width/22,color: Colors.green,),
                                      Text(
                                        "${surah?.verses[i].id}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600
                                        )

                                      )
                                    ],
                                  ),
                                  onTap: (){
                                    print("surah verse: ${surah?.verses[i].id}");
                                    showDialog(
                                      context: context,
                                      builder: (context) => FluidDialog(
                                        rootPage: FluidDialogPage(
                                          alignment: Alignment.bottomLeft,
                                          builder: (context) => const TestDialog(),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              ),
                            }
                          ],
                        ),
                      ),

                    ]),
                  ),
                ],
              ),
            ),
          ),
        ):const CircularProgressIndicator();

  }

  Stack header(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/images/head_soura.svg',
          height: MediaQuery.sizeOf(context).height/15,width: MediaQuery.sizeOf(context).width,
        color: Colors.green,),
        Row(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            surah?.type=="medinan"?Flexible(child: Image.asset("assets/images/masjid_nabawi.png",height:20,width: 20,)):Flexible(child: Image.asset("assets/images/kaaba.png",height: 20,width: 20)),
            //surah?.type=="medinan"?Text("مدنية  "):Text("  مكية"),
            //SizedBox(height: 1,width: 2,),
            Text(
              "${surah?.name}     ",
              style: const TextStyle(
                fontFamily: "MADDINA",
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            //SizedBox(height: 1,width: 2,),
            Text("${surah?.totalVerses}",
                style: const TextStyle(
                  fontFamily: "MADDINA",
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
            ),

          ],
        ),
        /*Text("سورة   ""${surah?.name}",
          style: const TextStyle(
            fontFamily: "MADDINA",
            fontSize: 25,
            color: Colors.black,
          ),
        ),*/

        /*Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${surah?.type}"=='medinan'?'مدنية':'مكية',
                  style: const TextStyle(
                    fontFamily: "MADDINA",
                    fontSize: 25,
                    color: Colors.black,
                  )
              ),
              //const Spacer(),
              Text(
                  "${surah?.name}",
                  style: const TextStyle(
                    fontFamily: "MADDINA",
                    fontSize: 25,
                    color: Colors.black,
                  ),
              ),
              //const Spacer(),
              Text("${surah?.totalVerses}",
                  style: const TextStyle(
                    fontFamily: "MADDINA",
                    fontSize: 25,
                    color: Colors.black,
                  )
              ),

            ],
          ),
        ),*/


      ],
    );

  }
}
