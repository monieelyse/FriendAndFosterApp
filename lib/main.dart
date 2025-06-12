// lib/main.dart

import 'package:flutter/material.dart';
import 'supabase_client.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FriendAndFosterApp());
}

class FriendAndFosterApp extends StatelessWidget {
  const FriendAndFosterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If a user is already signed in, go straight to Home
    final session = supabaseClient.auth.currentSession;
    return MaterialApp(
      title: 'Friend & Foster',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: session != null ? '/home' : '/login',
      routes: {
        '/login':   (ctx) => const LoginScreen(),
        '/signup':  (ctx) => const SignUpScreen(),
        '/home':    (ctx) => const HomeScreen(),
        '/profile': (ctx) => const ProfileScreen(),
      },
    );
  }
}
