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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(title: Text('data1')),
                  body: Container(),
                );
              }));
            },
            child: Text('push'),
          ),
        ),
      ),
    );
  }
}
