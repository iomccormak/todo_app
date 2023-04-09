// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA4YYR6idLujy27J328_xDNwYRFo29aCJE',
    appId: '1:806816616971:web:934bdd8a2c04eb9d57ed0e',
    messagingSenderId: '806816616971',
    projectId: 'todo-list-a5599',
    authDomain: 'todo-list-a5599.firebaseapp.com',
    storageBucket: 'todo-list-a5599.appspot.com',
    measurementId: 'G-8SQT4T367G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCWqZIaLmXtLZ2W-1hR0vwZsflnaJC0Uw',
    appId: '1:806816616971:android:867b9dab3365c99657ed0e',
    messagingSenderId: '806816616971',
    projectId: 'todo-list-a5599',
    storageBucket: 'todo-list-a5599.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtfXZgzFC1dLK_SscULcchDMEVqM1l3_c',
    appId: '1:806816616971:ios:f35c1194385f5d4857ed0e',
    messagingSenderId: '806816616971',
    projectId: 'todo-list-a5599',
    storageBucket: 'todo-list-a5599.appspot.com',
    iosClientId:
        '806816616971-6511g1glk2cr28oenrr3dd9a87h69j3g.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtfXZgzFC1dLK_SscULcchDMEVqM1l3_c',
    appId: '1:806816616971:ios:f35c1194385f5d4857ed0e',
    messagingSenderId: '806816616971',
    projectId: 'todo-list-a5599',
    storageBucket: 'todo-list-a5599.appspot.com',
    iosClientId:
        '806816616971-6511g1glk2cr28oenrr3dd9a87h69j3g.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}