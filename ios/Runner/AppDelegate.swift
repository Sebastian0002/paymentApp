import Flutter
import UIKit
import Stripe

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    StripeAPI.defaultPublishableKey = "pk_live_51QWXP2FGFaaC8gsOlVCDzhxTRRolYY4siC2g2MSSei1gayHAompJzrpmuIM0oeBtNKAAAxZbAw6bV8ofrxw3DnaX00vjDZKN2X"
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
