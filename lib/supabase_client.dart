// lib/supabase_client.dart

import 'package:supabase/supabase.dart';

const _supabaseUrl = 'https://wdeeuhwgkzabjcaimmln.supabase.co';
const _supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkZWV1aHdna3phYmpjYWltbWxuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkyMzUwNDMsImV4cCI6MjA2NDgxMTA0M30.LDqjLyBYgD8I0NybpAPvL7_kTsU1glio7D_Gr0z1yeg';

final SupabaseClient supabaseClient = SupabaseClient(
  _supabaseUrl,
  _supabaseKey,
);
