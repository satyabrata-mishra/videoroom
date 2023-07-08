import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videoroom_new/pages/login_page.dart';

import '../widgets/snackbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home-page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushNamed(context, LoginPage.routeName);
      });
    } catch (err) {
      SnackbarWidget(context, "Some unknown error occurred. ", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello User"),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            logout();
          },
        ),
      ),
    );
  }
}
