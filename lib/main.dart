import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO: Change these imports to match your file names!
import 'login_screen.dart';        // Your login/signup UI
import 'dog_profiles_screen.dart'; // Your main/home UI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://YOUR_PROJECT.supabase.co',    // TODO: Your Supabase project URL
    anonKey: 'YOUR_ANON_KEY',                   // TODO: Your Supabase anon public key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend & Foster',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

// This widget decides which screen to show based on auth state
class AuthGate extends StatefulWidget {
  const AuthGate({super.key});
  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;
        if (session == null) {
          return const LoginScreen(); // Show login if NOT logged in
        } else {
          return const DogProfilesScreen(); // Show main app if logged in
        }
      },
    );
  }
}
