import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:realised_app/Classes/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:realised_app/helper.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
        name: 'realised-souls',
        options: DefaultFirebaseOptions.currentPlatform);
  } else {
    Firebase.app(); // if already initialized, use that one
  }
  Map<String, dynamic> data = await loadDataFromJson();
  bool userNotificationStatus = await getNotificationStatus();
  UserInfo userInfo = UserInfo(userNotificationStatus);
  // Registration Token=dd0LdvNPRfeKQLa0W0Yjxx:APA91bFMGiRzRA_sntoqhdAeLM0FNppFfpsAJe8-AKNHuodmLIxHhlbW02NHG9ftQFywzzazhvPOZcmGJ7vRPNHX_cZcQt72y-lv4CQS9kOLvlIsxcVDyElLzv2AQ3KRAKzFnwdcDstE
  runApp(MyApp(data: data, userInfo: userInfo));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.data,
    required this.userInfo,
  });
  static const seedColor = Color(0xFF6F665A);
  final Map<String, dynamic> data;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realised Souls',
      initialRoute: '/',
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
      home: HomePage(
          title: 'Flutter Demo Home Page', data: data, userInfo: userInfo),
      // home: const MyHomePage(),
    );
  }
}
