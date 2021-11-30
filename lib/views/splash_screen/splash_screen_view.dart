import 'package:deezer_flutter_application/utils/views_utils/sizes_utils.dart';
import 'package:deezer_flutter_application/views/deezer/deezer_web_view.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      routeName: "/",
      navigateAfterSeconds: const DeezerWebView(),
      backgroundColor: Colors.white,
      photoSize: 200.0,
      loaderColor: Colors.white,
      title: Text(
        'Deezer flutter Application',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size_16),
      ),
      image: Image.asset(
        'assets/images/splash_screen_image.jpg',
        height: 200,
        width: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
