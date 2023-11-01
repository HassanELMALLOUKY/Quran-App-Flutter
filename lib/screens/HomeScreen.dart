import 'package:flutter/material.dart';
import 'package:quran_shamil/components/MainContent.dart';
import 'package:quran_shamil/components/MyAppBar.dart';
import 'package:quran_shamil/utils/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(),
        ),
        body: Stack(
            children: [
              Container(
                // the main Content is the Quaran in app Language
                child: MainContent(),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: Charge the Original Language Component (Arabic)
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
                  ),
                  child: const Text("Translate",style: TextStyle(color: Colors.black,fontSize: 20)),
                ),
              )
            ],
        ),
      ),
    );
  }
}
