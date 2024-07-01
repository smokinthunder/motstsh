import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Firebase/firebase_options.dart';
import 'themes/themes.dart';

import 'Authentication/login_page.dart';
import 'Authentication/signup_page.dart';
import 'Screens/home_page.dart';
import 'Screens/notification_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that the Flutter app initializes properly
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Motor Doc',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignupPage(),
        '/notification': (context) => const NotificationScreen()
      },
    );
  }
}
