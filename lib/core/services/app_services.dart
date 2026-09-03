


import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tamalok/core/utils/firebase_options.dart';

import '../utils/firebase_notifications_handler.dart';
import 'locator/locator.dart';

class AppServices {

  static void _configureCrashlytics() {
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // PlatformDispatcher.instance.onError = (error, stack) {
    //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    //   return true;
    // };
  }
  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await FirebaseNotificationsHandler().init();
    _configureCrashlytics();

    if (!Hive.isAdapterRegistered(0)) {
      await Hive.initFlutter();
    }
    configureDependencies();
  }
}
