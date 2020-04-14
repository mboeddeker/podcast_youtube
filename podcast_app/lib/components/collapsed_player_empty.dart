import 'package:flutter/material.dart';

class CollapsedPlayerEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          child: Placeholder(
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 16),
        Text(
          "Aktuell keine Wiedergabe", //TODO: String file
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
