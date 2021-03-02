import 'package:cashcontrol/src/utils/colores.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  _bannerMenu(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bannerMenu() {
    return Container(
      child: Row(
        children: [
          _menuItem(),
        ],
      ),
    );
  }

  Widget _menuItem() {
    return Container();
  }
}
