import 'dart:async';
// import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:realised_app/helper.dart';
import 'Classes/author.dart';
// import 'package:firebase_database/firebase_database.dart';

import 'homePage.dart';
import 'database.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
// FirebaseDatabase database = FirebaseDatabase.instance;

Timer scheduleTimeout([int milliseconds = 10000]) =>
    Timer(Duration(milliseconds: milliseconds), handleTimeout);

void handleTimeout() {
  x += 1;
}

int x = 0;

void main() async {
  await initializeFirebase();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Map<String, dynamic> data = await loadDataFromJson();
  // List<Author> auts = await getAuthors();
  // print(auts);
  AddToAuthors();
  // String s = eventSnap() as String;
  // updateDate(2);
  runApp(MyApp(data: data));
  addToDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.data});
  static const seedColor = Color(0xFF6F665A);
  final Map<String, dynamic> data;

  Future<Map<String, dynamic>> loadDataFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realised Souls',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        // fontFamily: GoogleFonts.openSans().fontFamily,
        // textTheme: GoogleFonts.openSansTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        textTheme: TextTheme(
          //appbar
          titleLarge: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: seedColor,
          ),
          titleMedium: GoogleFonts.openSans(
            //quote title
            fontSize: 14,
            decoration: TextDecoration.underline,
            color: seedColor,
          ),
          titleSmall: GoogleFonts.openSans(
            //info page subtitles, author names author page
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: seedColor,
          ),
          labelMedium: GoogleFonts.openSans(
            //time, notifications subtext
            fontSize: 14,
            color: seedColor.withOpacity(0.6),
          ),
          labelSmall: GoogleFonts.openSans(
            //bio on author page
            fontSize: 12,
            color: seedColor,
          ),
          bodyMedium: GoogleFonts.openSans(
            //main quote, info main
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: seedColor,
          ),
          bodySmall: GoogleFonts.judson(
            //quote author
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: seedColor,
          ),
        ),
        useMaterial3: true,
      ),
      home: HomePage(title: 'Flutter Demo Home Page', data: data),
    );
  }
}
