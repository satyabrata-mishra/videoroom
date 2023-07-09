import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'switch_screen.dart';

import '../widgets/image_button_widget.dart';
import '../widgets/snackbar_widget.dart';
import '../widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/login-page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamed(context, SwitchScreen.routeName);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  void handle_error(String msg) {
    Future.delayed(Duration.zero)
        .then((value) => SnackbarWidget(context, msg, Colors.red));
  }

  void googleSignIn() async {
    try {
      // setState(() {
      //   isLoading1 = true;
      // });
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credentials);
      if (user.user != null) {
        Navigator.pushNamed(context, SwitchScreen.routeName);
      }
      // setState(() {
      //   isLoading1 = false;
      // });
    } catch (err) {
      // setState(() {
      //   isLoading1 = false;
      // });
      print(err);
      handle_error("Some internal error occurred. Please try again later.");
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    const divider = Divider(
      color: Colors.black,
      height: 25,
      thickness: 1.5,
      indent: 30,
      endIndent: 30,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            "Welcome!",
            mediaQuery.size.width * 0.11,
            FontWeight.w800,
            1,
          ),
          TextWidget(
            "Login or signup with google!",
            mediaQuery.size.width * 0.051,
            FontWeight.w500,
            1.4,
          ),
          divider,
          ButtonWidget(
            mediaQuery.size.height * 0.08,
            mediaQuery.size.width * 0.9,
            Colors.black26,
            "lib/assets/google.png",
            "Continue with Google",
            21,
            FontWeight.w500,
            30,
            googleSignIn,
          ),
          divider,
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: TextWidget(
              "*By signing in you agree with our terms and conditions.",
              16,
              FontWeight.w500,
              0,
            ),
          )
        ],
      ),
    );
  }
}
