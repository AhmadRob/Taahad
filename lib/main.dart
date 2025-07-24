import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status bar color
      statusBarIconBrightness: Brightness.dark, // For Android
      statusBarBrightness: Brightness.light, // For iOS
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      title: 'Quran Demo', // Application title
      home: const HomePage(), // The starting widget of the app
      theme: ThemeData(
        textTheme: GoogleFonts
            .amiriTextTheme(), // Set global text theme using Google Fonts
      ),
    );
  }
}
