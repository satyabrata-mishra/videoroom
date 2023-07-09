import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import 'snackbar_widget.dart';

void logout(BuildContext context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.scale,
    title: 'Confirm Logout?',
    btnCancelOnPress: () {},
    btnOkOnPress: () async {
      try {
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.pushNamed(context, LoginPage.routeName);
        });
      } catch (err) {
        SnackbarWidget(context, "Some unknown error occurred. ", Colors.red);
      }
    },
    btnCancelText: "CANCEL",
    btnOkText: "OK",
  ).show();
}

Drawer DrawerWidget(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.7,
    backgroundColor: Colors.black12,
    child: Column(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  backgroundImage: user?.photoURL == null
                      ? const AssetImage("lib/assets/image-not-avaliable.png")
                      : NetworkImage(user?.photoURL as String)
                          as ImageProvider<Object>?,
                ),
              ),
              Text(
                user?.displayName as String,
                style: const TextStyle(
                    fontSize: 22,
                    letterSpacing: 0.6,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                user?.email as String,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          iconColor: Colors.white,
          leading: const Icon(Icons.logout),
          title: const Text(
            "LOGOUT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 0.8,
            ),
          ),
          onTap: () {
            logout(context);
          },
        ),
      ],
    ),
  );
}
