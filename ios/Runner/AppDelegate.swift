import UIKit
import Flutter
import UserNotifications  // Import UserNotifications framework
import Firebase          // Import Firebase (if using Firebase)

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Initialize Firebase (if using Firebase)
    FirebaseApp.configure()

    if #available(iOS 10.0, *) {
        // Set UNUserNotificationCenterDelegate
        UNUserNotificationCenter.current().delegate = self

        // Request notification permissions
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in }
        )
    }

    application.registerForRemoteNotifications()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}