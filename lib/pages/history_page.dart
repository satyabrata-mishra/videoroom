import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videoroom_new/widgets/drawer_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static const routeName = "/history-page";
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("History Retrieving Will Be Available Soon!!!"),
      ),
      drawer: DrawerWidget(context),
    );
  }
}
