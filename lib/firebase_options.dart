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
    apiKey: 'AIzaSyDFWvGt47qRDydVacPYaOD6391FjJT7QjQ',
    appId: '1:738661972604:web:cba0f41a976641bf5567f9',
    messagingSenderId: '738661972604',
    projectId: 'luxury-footwear-app',
    authDomain: 'luxury-footwear-app.firebaseapp.com',
    storageBucket: 'luxury-footwear-app.firebasestorage.app',
    measurementId: 'G-XWT56PVGJM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEYIj7lH_YWUfhAx40WXVlqXmV3Ad3m8A',
    appId: '1:738661972604:android:9a73931e571980a25567f9',
    messagingSenderId: '738661972604',
    projectId: 'luxury-footwear-app',
    storageBucket: 'luxury-footwear-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTAUT3VxfmK7lk6pey3fChTtcSQFIZNKE',
    appId: '1:738661972604:ios:484f7fe3ddd8ddff5567f9',
    messagingSenderId: '738661972604',
    projectId: 'luxury-footwear-app',
    storageBucket: 'luxury-footwear-app.firebasestorage.app',
    iosBundleId: 'com.example.luxuryFootwearApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTAUT3VxfmK7lk6pey3fChTtcSQFIZNKE',
    appId: '1:738661972604:ios:484f7fe3ddd8ddff5567f9',
    messagingSenderId: '738661972604',
    projectId: 'luxury-footwear-app',
    storageBucket: 'luxury-footwear-app.firebasestorage.app',
    iosBundleId: 'com.example.luxuryFootwearApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDFWvGt47qRDydVacPYaOD6391FjJT7QjQ',
    appId: '1:738661972604:web:a9f6d292b667e02c5567f9',
    messagingSenderId: '738661972604',
    projectId: 'luxury-footwear-app',
    authDomain: 'luxury-footwear-app.firebaseapp.com',
    storageBucket: 'luxury-footwear-app.firebasestorage.app',
    measurementId: 'G-8WDBWE4XZG',
  );
}
