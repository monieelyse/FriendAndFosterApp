// lib/auth_service.dart

import 'package:supabase/supabase.dart';
import 'supabase_client.dart';

class AuthService {
  final SupabaseClient _client = supabaseClient;

  /// Sign-up with email & password
  Future<AuthResponse> signUp(String email, String password) {
    return _client.auth.signUp(email: email, password: password);
  }

  /// Sign-in with email & password
  Future<AuthResponse> signIn(String email, String password) {
    return _client.auth.signInWithPassword(email: email, password: password);
  }

  /// Sign-out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Current user, or null if not signed in
  User? get currentUser => _client.auth.currentUser;
}