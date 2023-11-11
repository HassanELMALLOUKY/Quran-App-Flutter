import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_shamil/providers/DialogProvider.dart';
import 'package:quran_shamil/providers/SplashScreenProvider.dart';
import 'package:quran_shamil/providers/SurahProvider.dart';
import 'package:quran_shamil/screens/HomeScreen.dart';
import 'package:quran_shamil/screens/SplashScreen.dart';
import 'package:quran_shamil/utils/Colors.dart';
import 'package:quran_shamil/utils/ImageUtils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Preload the SVG images.
  ImageUtils.svgPrecacheImage();
  /*final loader = SvgAssetLoader();
  await loader.loadAsset('assets/my_image.svg');
  await loader.loadAsset('assets/my_other_image.svg');*/
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashProvider()),
          ChangeNotifierProvider(create: (_)=>SurahProvider()),
          ChangeNotifierProvider(create: (_)=>DialogProvider()),
        ],
        child: const MyApp(),
      )
    /*DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SplashProvider()),
            ChangeNotifierProvider(create: (_)=>SurahProvider()),
            ChangeNotifierProvider(create: (_)=>DialogProvider()),
          ],
          child: const MyApp(),
        );
      },

    )*/
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
      },
      title: 'Al-Quran Al-Shamil',
      // the Dark Them :
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        primaryColorLight: AppColors.primaryLight,
        useMaterial3: true,
      ),
      // the Dark Them :
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        primaryColorLight: AppColors.primaryLight,
      ),
      home: splashProvider.seenSplash
          ? const HomeScreen() // Replace with your main app screen
          : SplashScreen(),
    );
  }
}
