import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wdeeuhwgkzabjcaimmln.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkZWV1aHdna3phYmpjYWltbWxuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkyMzUwNDMsImV4cCI6MjA2NDgxMTA0M30.LDqjLyBYgD8I0NybpAPvL7_kTsU1glio7D_Gr0z1yeg',
  );

  runApp(const FriendAndFosterApp());
}

class FriendAndFosterApp extends StatelessWidget {
  const FriendAndFosterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend and Foster',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
