import 'package:flutter/material.dart';

class AppLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
