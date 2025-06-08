// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'supabase_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = supabaseClient.auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await supabaseClient.auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, ${user?.email ?? 'User'}!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
