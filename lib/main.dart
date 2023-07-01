import 'package:flutter/material.dart';

import 'package:run_collab/theme/color_schemes.g.dart'; // Theme file
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase dependency
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  String? supaUrl = dotenv.env['SUPABASE_URL'];
  String? supaAnnon = dotenv.env['SUPABASE_ANON'];

  await Supabase.initialize(
    url: supaUrl!,
    anonKey: supaAnnon!,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Container(),
    );
  }
}
