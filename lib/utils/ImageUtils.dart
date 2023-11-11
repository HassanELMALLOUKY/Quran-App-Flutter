import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {

  static const String quranSvg = 'assets/images/quran.svg';
  static const String basmalaSvg = 'assets/images/Basmala.svg';
  static const String ayaSv = 'assets/images/aya_1.svg';
  static const String surahBorderSvg= 'assets/images/head_soura.svg';
  static const String kaaba= "assets/images/kaaba.png";
  static const String masjidNabawi= "assets/images/masjid_nabawi.png";



  static void svgPrecacheImage() {

    const cacheSvgImages = [  /// Specify the all the svg image to cache
      ImageUtils.quranSvg,
      ImageUtils.basmalaSvg,
      ImageUtils.ayaSv,
      ImageUtils.surahBorderSvg,
      ImageUtils.kaaba,
      ImageUtils.masjidNabawi,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }

  }

}