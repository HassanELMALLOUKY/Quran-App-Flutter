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
      /*MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashProvider()),
          ChangeNotifierProvider(create: (_)=>SurahProvider()),
          ChangeNotifierProvider(create: (_)=>DialogProvider()),
        ],
        child: const MyApp(),
      )*/
    DevicePreview(
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

    )
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
