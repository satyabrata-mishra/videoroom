import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import './pages/history_page.dart';
import './pages/switch_screen.dart';
import './pages/home_page.dart';
import './pages/login_page.dart';
import './pages/opening_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Videoroom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        OpeningPage.routeName: (context) => const OpeningPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        SwitchScreen.routeName: (context) => SwitchScreen(),
        HistoryPage.routeName: (context) => const HistoryPage(),
      },
    );
  }
}
