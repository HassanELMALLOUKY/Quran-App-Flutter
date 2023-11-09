import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {

  static const String quranSvg = 'assets/images/quran.svg';
  static const String basmalaSvg = 'assets/images/Basmala.svg';
  static const String ayaSv = 'assets/images/aya_1.svg';
  static const String surahBorderSvg= 'assets/images/Sura_border.svg';


  static void svgPrecacheImage() {

    const cacheSvgImages = [  /// Specify the all the svg image to cache
      ImageUtils.quranSvg,
      ImageUtils.basmalaSvg,
      ImageUtils.ayaSv,
      ImageUtils.surahBorderSvg,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }

  }

}