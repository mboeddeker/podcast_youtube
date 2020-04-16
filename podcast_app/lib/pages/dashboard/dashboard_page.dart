import 'package:flutter/material.dart';
import 'package:podcast_app/components/charts_row/charts_row.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Podcasts", //TODO: Add to string file
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          ChartRow(
            title: "Top Podcasts",
          )
        ]),
      ),
    );
  }
}
