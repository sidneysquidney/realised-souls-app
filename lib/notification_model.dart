// import 'package:flutter/foundation.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();

//   static Future showNotifications({
//     int id = 0,
// String? title,
// String? body,
// String? payload,
//   }) async =>
// }

// class NotificationModel with ChangeNotifier {
//   bool _receiveNotifications = false;

//   bool get receiveNotifications => _receiveNotifications;

//   // Initialize the state from shared preferences when the model is created.
//   NotificationModel() {
//     _loadState();
//   }

//   // Load the notification status from shared preferences.
//   Future<void> _loadState() async {
//     final prefs = await SharedPreferences.getInstance();
//     _receiveNotifications = prefs.getBool('notifications_enabled') ?? false;
//     notifyListeners();
//   }

//   // Toggle the notification status and save it to shared preferences.
//   Future<void> toggleNotificationStatus() async {
//     _receiveNotifications = !_receiveNotifications;
//     notifyListeners();

//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('notifications_enabled', _receiveNotifications);
//   }
// }
