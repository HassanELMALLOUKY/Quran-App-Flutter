

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

class SurahPage extends StatefulWidget {
  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  Surah? surah;
  int buildCount = 0;
  final TextEditingController _textController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print("build again ${buildCount++} times");
    context.watch<SurahProvider>().fetchData();
    //context.watch<SurahProvider>().fetchSurah(1);
    //getSurah2(context,1);
    Size size=MediaQuery.sizeOf(context);
    return Directionality(
          textDirection: TextDirection.rtl,
          child: Consumer<SurahProvider>(
            builder:(context,surahProvider,child) => Scaffold(
              body: surahProvider.listSurah.isNotEmpty?SafeArea(
                minimum: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: size.width/2,
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(hintText: 'Enter between 1 and 114'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      surahProvider.increment(int.parse(_textController.text));
                    },
                        child: const Text("Go to the next surah")),
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset('assets/images/head_soura.svg',
                            height: MediaQuery.sizeOf(context).height/15,width: MediaQuery.sizeOf(context).width,
                            color: Colors.green,),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              surahProvider.listSurah[surahProvider.indexSurah]?.type=="medinan"?Flexible(child: Image.asset("assets/images/masjid_nabawi.png",height:20,width: 20,)):Flexible(child: Image.asset("assets/images/kaaba.png",height: 20,width: 20)),
                              Text(
                                "${surahProvider.listSurah[surahProvider.indexSurah]?.name}",
                                style: const TextStyle(
                                  fontFamily: "MADDINA",
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              //SizedBox(height: 1,width: 2,),
                              Text("${surahProvider.listSurah[surahProvider.indexSurah]?.totalVerses}",
                                  style: const TextStyle(
                                      fontFamily: "MADDINA",
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  )
                              ),

                            ],
                          ),
                        ],
                      ),
                    Expanded(
                      child: ListView(
                          children: [
                        SvgPicture.asset("assets/images/Basmala.svg",height: size.height/20,width: size.width,fit: BoxFit.scaleDown),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              for (var i = 0; i < surahProvider.listSurah[surahProvider.indexSurah]!.verses.length; i++) ...{
                                TextSpan(
                                  text: ' ${surahProvider.listSurah[surahProvider.indexSurah]?.verses[i].text} ',
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
                                          "${surahProvider.listSurah[surahProvider.indexSurah]?.verses[i].id}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                          )

                                        )
                                      ],
                                    ),
                                    onTap: (){
                                      print("surah verse: ${surahProvider.listSurah[surahProvider.indexSurah]?.verses[i].id}");
                                      showDialog(
                                        context: context,
                                        builder: (context) => FluidDialog(
                                          rootPage: FluidDialogPage(
                                            alignment: Alignment.bottomCenter,
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
              ):const Center(child: CircularProgressIndicator(),)
            ),
          ),
        );

  }

}

