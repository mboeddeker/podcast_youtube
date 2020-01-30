import 'package:flutter/material.dart';

import 'package:podcast_app/pages/dashboard/dashboard_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(child: DashboardPage()),
          Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
