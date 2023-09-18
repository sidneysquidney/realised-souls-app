import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'homePage.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const seedColor = Color(0xFF6F665A);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realised Souls',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
