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
    apiKey: 'AIzaSyAdc50QYn81uVKNmE56XWddDmPqOasRfNg',
    appId: '1:748109666639:web:66df3952ff930cda6f0d3a',
    messagingSenderId: '748109666639',
    projectId: 'chronicle-852fa',
    authDomain: 'chronicle-852fa.firebaseapp.com',
    storageBucket: 'chronicle-852fa.firebasestorage.app',
    measurementId: 'G-5D5WK5FHV2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaP45Sq9PkkzA0cp8AYvkTgva1ZXJf-Eg',
    appId: '1:748109666639:android:e83e487680bd2a616f0d3a',
    messagingSenderId: '748109666639',
    projectId: 'chronicle-852fa',
    storageBucket: 'chronicle-852fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxmlsmziJkhxeKN3ELtNM-W-UX8CehLhA',
    appId: '1:748109666639:ios:c6be184ffac53d146f0d3a',
    messagingSenderId: '748109666639',
    projectId: 'chronicle-852fa',
    storageBucket: 'chronicle-852fa.firebasestorage.app',
    iosBundleId: 'com.mrbooi.org.chronicle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxmlsmziJkhxeKN3ELtNM-W-UX8CehLhA',
    appId: '1:748109666639:ios:507dae964afb0f906f0d3a',
    messagingSenderId: '748109666639',
    projectId: 'chronicle-852fa',
    storageBucket: 'chronicle-852fa.firebasestorage.app',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdc50QYn81uVKNmE56XWddDmPqOasRfNg',
    appId: '1:748109666639:web:11b00f5164ffc8fe6f0d3a',
    messagingSenderId: '748109666639',
    projectId: 'chronicle-852fa',
    authDomain: 'chronicle-852fa.firebaseapp.com',
    storageBucket: 'chronicle-852fa.firebasestorage.app',
    measurementId: 'G-TZN7ZYH1ME',
  );
}
