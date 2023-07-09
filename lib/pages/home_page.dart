import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/generate_room_id.dart';

import 'login_page.dart';

import '../widgets/icon_button_widget.dart';
import '../widgets/image_button_widget.dart';
import '../widgets/snackbar_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home-page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  TextEditingController joinRoomId = TextEditingController();
  bool isCreateRoom = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (user == null) {
      Navigator.pushNamed(context, LoginPage.routeName);
    }
  }

  void showCreateOrJoinModal() {
    joinRoomId.text = "";
    if (isCreateRoom) {
      createRoom();
    } else {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.red,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                textfieldWidget(
                  "Enter Room ID",
                  Icons.group,
                  false,
                  joinRoomId,
                ),
                buttonWidget(
                  context,
                  "JOIN ROOM",
                  () {
                    Navigator.of(context).pop();
                    joinRoom();
                  },
                  false,
                  18,
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void createRoom() {
    print("Created room id id ${generateRoomId()}");
  }

  void joinRoom() {
    if (joinRoomId.text.isEmpty) {
      SnackbarWidget(context, "Please enter a room id.", Colors.red);
      return;
    }
    if (joinRoomId.text.length != 6) {
      SnackbarWidget(context, "Room id should be of 6 digits.", Colors.red);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Hello ${user?.displayName?.substring(0, user?.displayName?.indexOf(" "))}")),
      body: Padding(
        padding: EdgeInsets.all(mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              mediaQuery.height * 0.08,
              mediaQuery.width * 0.9,
              Colors.red,
              "lib/assets/join-room.png",
              "JOIN ROOM",
              20,
              FontWeight.bold,
              30,
              () {
                isCreateRoom = false;
                showCreateOrJoinModal();
              },
            ),
            SizedBox(height: mediaQuery.height * 0.04),
            ButtonWidget(
              mediaQuery.height * 0.08,
              mediaQuery.width * 0.9,
              Colors.amber,
              "lib/assets/create-room.png",
              " CREATE ROOM",
              20,
              FontWeight.bold,
              30,
              () {
                isCreateRoom = true;
                showCreateOrJoinModal();
              },
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(context),
    );
  }
}
