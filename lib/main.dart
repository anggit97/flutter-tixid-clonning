import 'package:flutter/material.dart';

import 'views/splash_screen.dart';

main() => runApp(TixApp());

class TixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tix Clone",
      theme: ThemeData(fontFamily: "sfui"),
      home: SplashScreen(),
    );
  }
}