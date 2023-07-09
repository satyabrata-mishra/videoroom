import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'history_page.dart';
import 'home_page.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);
  static const routeName = "/switch-screen";
  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? const HomePage() : const HistoryPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (x) {
          setState(() {
            index = x;
          });
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Call History",
          ),
        ],
      ),
    );
  }
}
