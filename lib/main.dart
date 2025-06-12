import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'providers/app_state.dart';
import 'providers/cart_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chick Kicks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 👇 Go directly to HomePage
      home: HomePage(),

      // Optional routes if needed
      routes: {
        '/register': (context) => RegisterPage(),
        // '/': (context) => LoginPage(), // leave commented for now
      },
    );
  }
}

