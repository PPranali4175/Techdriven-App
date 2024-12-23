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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCr35MTaOlM1g1uFzoFhD9y-WDsz4LVo04',
    appId: '1:729805586290:web:fefbace35af6ca8feb27eb',
    messagingSenderId: '729805586290',
    projectId: 'online-learning-app-c4614',
    authDomain: 'online-learning-app-c4614.firebaseapp.com',
    storageBucket: 'online-learning-app-c4614.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuep_wl8maflEB5R-f1UUj5Tk9F4C95RA',
    appId: '1:729805586290:android:4a6500793bbab3e0eb27eb',
    messagingSenderId: '729805586290',
    projectId: 'online-learning-app-c4614',
    storageBucket: 'online-learning-app-c4614.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA82AStYX0xWVGr8gwF82Y2x63HnsvfwOo',
    appId: '1:729805586290:ios:d2de21f2ad27c3cdeb27eb',
    messagingSenderId: '729805586290',
    projectId: 'online-learning-app-c4614',
    storageBucket: 'online-learning-app-c4614.appspot.com',
    iosClientId: '729805586290-gt0o5qnqbe88vnovjvt7769rn71qli1h.apps.googleusercontent.com',
    iosBundleId: 'com.example.majorproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB6s4AdwkxGrQ2W9o4ZmG4MSe_DELw4MO8',
    appId: '1:729805586290:web:7f254cc330b8d5cbeb27eb',
    messagingSenderId: '729805586290',
    projectId: 'online-learning-app-c4614',
    authDomain: 'online-learning-app-c4614.firebaseapp.com',
    storageBucket: 'online-learning-app-c4614.appspot.com',
  );
}
