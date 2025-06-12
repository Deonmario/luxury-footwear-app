import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';
import 'pages/home_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // 👈 Added
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chick Kicks',
      themeMode: themeProvider.themeMode, // 👈 Listen to theme changes
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
      routes: {
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
