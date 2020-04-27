import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            color: Colors.black26,
            onPressed: () {},
            child: Text('push'),
          ),
        ),
      ),
    );
  }
}
