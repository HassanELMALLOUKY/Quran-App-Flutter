
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/SplashScreenProvider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = Provider.of<SplashProvider>(context).language; // Default selected language
    List<Map<String, String>> languages = [
      {
        'name': 'Arabic',
        'flag': 'assets/images/arabic_flag.png',
      },
      {
        'name': 'English',
        'flag': 'assets/images/english_flag.png',
      },
    ];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Choose Your Language:",style: TextStyle(fontSize: 20,color: Colors.black),),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: context.watch<SplashProvider>().language,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                onChanged: (String? newValue) {
                      context.read<SplashProvider>().language=newValue!;
                },
                items: languages.map<DropdownMenuItem<String>>((Map<String, String> value) {
                  return DropdownMenuItem<String>(
                    value: value['name'],
                    child: Row(
                      children: [
                        Image.asset(
                          value['flag']!,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(value['name']!),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SvgPicture.asset('assets/images/quran.svg',
              placeholderBuilder: (BuildContext context)=>const CircularProgressIndicator(),
              height: MediaQuery.sizeOf(context).height/2,width: MediaQuery.sizeOf(context).width,), // Replace with your image asset
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 // Navigate to your main app screen
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
              ),
              child: const Text("Get Started",style: TextStyle(color: Colors.black,fontSize: 20)),
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
