import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymshare/pages/splash_screen.dart';
import 'package:gymshare/settings/colors.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymshare',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: primaryColor,
        primaryColor: secondaryColor,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
