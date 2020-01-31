import 'package:flutter/material.dart';

abstract class Input {}

abstract class Output {
  BorderRadiusGeometry get panelRadius;
}

class MainPageViewModel implements Input, Output {
  @override
  BorderRadiusGeometry get panelRadius => BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      );
}
