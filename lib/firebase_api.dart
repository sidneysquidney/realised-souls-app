// import 'dart:html';
// import 'dart:js';


// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
//   print('Data: ${message.data}');
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   final data = message.data;
//   data["page"] = "home";
//   // if (data.containsKey("page")) {
//   //   data["page"] = "home";
//   // }
// }

// void _handleNotificationClick(Map<String, dynamic> data) {
//   if (data.containsKey("page")) {
//     final page = data["page"];
//     if (page == "home") {
//       // Navigate to the homepage
//       Navigator.of(context as BuildContext).pushNamed('/');
//     } else if (page == "otherPage") {
//       // Navigate to another page
//       Navigator.of(context as BuildContext).pushNamed('/otherPage');
//     }
//   }
// }

// class FirebaseApi {
//   final messaging = FirebaseMessaging.instance;

//   Future<void> initNotifications() async {
//     final settings = await messaging.requestPermission(sound: false);
//     String? token = await messaging.getToken();
//     print("token: $token");
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _handleNotificationClick(message.data);
//     });
//   }
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
//   print('Data: ${message.data}');
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   final data = message.data;
//   data["page"] = "home";
//   if (data.containsKey("page")) {
//     final page = data["page"];
//     if (page == "home") {
//       // Navigate to the homepage
//       Navigator.of(context as BuildContext).pushNamed('/');
//     } else if (page == "otherPage") {
//       // Navigate to another page
//       Navigator.of(context as BuildContext).pushNamed('/otherPage');
//     }
//     // if (data.containsKey("page")) {
//     //   data["page"] = "home";
//     // }
//   }
// }
