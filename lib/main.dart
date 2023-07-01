import 'package:flutter/material.dart';

import 'package:run_collab/theme/color_schemes.g.dart'; // Theme file
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase dependency
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:run_collab/pages/LoginPage/login_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  String? supaUrl = dotenv.env['SUPABASE_URL'];
  String? supaAnnon = dotenv.env['SUPABASE_ANON'];

  await Supabase.initialize(
    url: supaUrl!,
    anonKey: supaAnnon!,
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (_) => const BeginScreen(),
        '/login': (_) => const LoginPage(),
        '/': (_) => Container(),
      },
    );
  }
}

class BeginScreen extends StatefulWidget {
  const BeginScreen({super.key});

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
