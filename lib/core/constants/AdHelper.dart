import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111'; // test banner id
      return 'ca-app-pub-1759983707734879/1255965404'; // production banner id
    } else if (Platform.isIOS) {
      // return 'ca-app-pub-3940256099942544/2934735716'; // test ios banner id
      return 'ca-app-pub-1759983707734879/1475457254';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/1033173712'; // test interstitial
      return 'ca-app-pub-1759983707734879/2185903690'; // production interstitial
    } else if (Platform.isIOS) {
      // return 'ca-app-pub-3940256099942544/4411468910'; // test ios interstitial ad
      return 'ca-app-pub-1759983707734879/2596967231'; // ca-app-pub-1759983707734879/2596967231 production ios interstitial
    }
    throw new UnsupportedError("Unsupported platform");
  }
}