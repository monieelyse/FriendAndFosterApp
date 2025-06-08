// lib/main.dart

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FriendAndFosterApp());
}

class FriendAndFosterApp extends StatelessWidget {
  const FriendAndFosterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend & Foster',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/login',
      routes: {
        '/login': (c) => const LoginScreen(),
        '/signup': (c) => const SignUpScreen(),
        '/home'  : (c) => const HomeScreen(),
      },
    );
  }
}
