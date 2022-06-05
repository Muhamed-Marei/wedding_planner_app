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
    apiKey: 'AIzaSyAl4O5bLxRPuBChntdJDmugQXy_GYMNQyw',
    appId: '1:943196194860:web:3892005e8a179ffb222989',
    messagingSenderId: '943196194860',
    projectId: 'wedding-organizer-1',
    authDomain: 'wedding-organizer-1.firebaseapp.com',
    storageBucket: 'wedding-organizer-1.appspot.com',
    measurementId: 'G-1E74WSQ6HS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWPOkkwVeesuGDteG-0o-066r3Feyeg0g',
    appId: '1:943196194860:android:0d9bc09b5c75f2a6222989',
    messagingSenderId: '943196194860',
    projectId: 'wedding-organizer-1',
    storageBucket: 'wedding-organizer-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVm491-vEM7EWLSoLr4p-TGOxVaQJchv8',
    appId: '1:943196194860:ios:fd5016d68514c35a222989',
    messagingSenderId: '943196194860',
    projectId: 'wedding-organizer-1',
    storageBucket: 'wedding-organizer-1.appspot.com',
    androidClientId: '943196194860-3lj02368h9j0j6ncbv27mt659cl4cgq4.apps.googleusercontent.com',
    iosClientId: '943196194860-9gg9k9g94u4dbmgi037e9cb130lp5kao.apps.googleusercontent.com',
    iosBundleId: 'com.example.weddingPlannerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVm491-vEM7EWLSoLr4p-TGOxVaQJchv8',
    appId: '1:943196194860:ios:fd5016d68514c35a222989',
    messagingSenderId: '943196194860',
    projectId: 'wedding-organizer-1',
    storageBucket: 'wedding-organizer-1.appspot.com',
    androidClientId: '943196194860-3lj02368h9j0j6ncbv27mt659cl4cgq4.apps.googleusercontent.com',
    iosClientId: '943196194860-9gg9k9g94u4dbmgi037e9cb130lp5kao.apps.googleusercontent.com',
    iosBundleId: 'com.example.weddingPlannerApp',
  );
}
