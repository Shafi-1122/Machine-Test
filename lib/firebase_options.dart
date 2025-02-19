// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBa2f5ZINz4ZuUJh4GIfnfHaEaHIAMVFcU',
    appId: '1:399329982469:web:0ff72ae7802374dc9dc46c',
    messagingSenderId: '399329982469',
    projectId: 'diet-planner-4d43d',
    authDomain: 'diet-planner-4d43d.firebaseapp.com',
    storageBucket: 'diet-planner-4d43d.firebasestorage.app',
    measurementId: 'G-TLEPJD429W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDU-KA1WoTiOMu6LbhidCGAhkEvcaqjsyg',
    appId: '1:399329982469:android:db7814560027c17b9dc46c',
    messagingSenderId: '399329982469',
    projectId: 'diet-planner-4d43d',
    storageBucket: 'diet-planner-4d43d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSIPTDhzRWSPsONSGbgQ4NFDyFN6yR5A4',
    appId: '1:399329982469:ios:eeee4cf4e8cef3c19dc46c',
    messagingSenderId: '399329982469',
    projectId: 'diet-planner-4d43d',
    storageBucket: 'diet-planner-4d43d.firebasestorage.app',
    iosClientId: '399329982469-hjnm5fra4pah819rnqjac3qde1b9g69q.apps.googleusercontent.com',
    iosBundleId: 'com.example.zartekTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSIPTDhzRWSPsONSGbgQ4NFDyFN6yR5A4',
    appId: '1:399329982469:ios:eeee4cf4e8cef3c19dc46c',
    messagingSenderId: '399329982469',
    projectId: 'diet-planner-4d43d',
    storageBucket: 'diet-planner-4d43d.firebasestorage.app',
    iosClientId: '399329982469-hjnm5fra4pah819rnqjac3qde1b9g69q.apps.googleusercontent.com',
    iosBundleId: 'com.example.zartekTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBa2f5ZINz4ZuUJh4GIfnfHaEaHIAMVFcU',
    appId: '1:399329982469:web:8977e685861eb5789dc46c',
    messagingSenderId: '399329982469',
    projectId: 'diet-planner-4d43d',
    authDomain: 'diet-planner-4d43d.firebaseapp.com',
    storageBucket: 'diet-planner-4d43d.firebasestorage.app',
    measurementId: 'G-GPZT65WGMC',
  );
}
