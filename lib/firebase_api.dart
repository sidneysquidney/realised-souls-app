import 'package:firebase_messaging/firebase_messaging.dart';

class FireaseApi {
  final messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    final settings = await messaging.requestPermission();
    String? token = await messaging.getToken();
    print("token: $token");
  }
}
