// messaging and notifications
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// normal
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:realised_app/helper.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: Add stream controller
// TODO: Define the background message handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Map<String, dynamic> data = await loadDataFromJson();
  // Map<String, dynamic> data = await getData(); //from database

  // TODO: Request permission
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }
  // TODO: Register with FCM
  // It requests a registration token for sending messages to users from your App server or other trusted server environment.
  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }
  // Registration Token=dd0LdvNPRfeKQLa0W0Yjxx:APA91bFMGiRzRA_sntoqhdAeLM0FNppFfpsAJe8-AKNHuodmLIxHhlbW02NHG9ftQFywzzazhvPOZcmGJ7vRPNHX_cZcQt72y-lv4CQS9kOLvlIsxcVDyElLzv2AQ3KRAKzFnwdcDstE

  // TODO: Set up foreground message handler
  // TODO: Set up background message handler
  runApp(MyApp(data: data));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.data});
  static const seedColor = Color(0xFF6F665A);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realised Souls',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
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
