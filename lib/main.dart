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
import 'package:rxdart/rxdart.dart';

// used to pass messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();
// // TODO: Define the background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

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
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
  });
  // // TODO: Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
      // home: HomePage(title: 'Flutter Demo Home Page', data: data),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lastMessage = "";

  _MyHomePageState() {
    _messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\nTitle=${message.notification?.title},'
              '\nBody=${message.notification?.body},'
              '\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sids message testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Last message from Firebase Messaging:',
                style: Theme.of(context).textTheme.titleLarge),
            Text(_lastMessage, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
