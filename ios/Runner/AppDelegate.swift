import Flutter
import UIKit
import GoogleMaps  // ✅ أضف السطر ده

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAjgStbh-e-qcdbVrzM8c_FioP-8zGlXvA") // ✅ أضف السطر ده
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
