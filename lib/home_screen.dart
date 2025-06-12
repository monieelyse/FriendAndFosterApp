// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'supabase_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    await supabaseClient.auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final user = supabaseClient.auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // Profile button
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, ${user?.email ?? 'Guest'}!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
