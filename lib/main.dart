import 'package:deezer_flutter_application/utils/locator.dart';
import 'package:deezer_flutter_application/utils/routes.dart';
import 'package:deezer_flutter_application/views/artist/artists_view.dart';
import 'package:deezer_flutter_application/views/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';

import 'utils/size_config.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          title: 'Deezer Flutter application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreenView(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
        );
      });
    });
  }
}
