
import 'package:flutter/material.dart';
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                border: Border.all(),
              ),
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: context.watch<SplashProvider>().language,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
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
            Image.asset('assets/images/quran-icon-splash-screen.png'), // Replace with your image asset
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

          ],
        ),
      ),
    );
  }
}
