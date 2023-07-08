import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class OpeningPage extends StatefulWidget {
  static const routeName = "/";

  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => user == null
            ? Navigator.pushNamed(context, LoginPage.routeName)
            : Navigator.pushNamed(context, HomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/videoroom-logo.png",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const Text(
              "VIDEOROOM",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                letterSpacing: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
