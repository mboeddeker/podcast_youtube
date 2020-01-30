import 'package:flutter/material.dart';
import 'package:podcast_app/pages/intro_slider/intro_page.dart';

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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return IntroPage();
              }));
            },
            child: Text('push'),
          ),
        ),
      ),
    );
  }
}
