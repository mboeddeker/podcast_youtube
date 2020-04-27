import 'package:flutter/material.dart';
import 'package:podcast_app/core/utils/generic_state.dart';

abstract class Input {
  void onChangeTab(int index);
}

abstract class Output {
  BorderRadiusGeometry get panelRadius;

  GenericState<int> provideTabIndex();
}

class MainPageViewModel implements Input, Output {
  GenericState<int> _currentTabIndex = GenericState.initWith(0);

  @override
  BorderRadiusGeometry get panelRadius => BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      );

  @override
  void onChangeTab(int index) {
    _currentTabIndex.value = index;
  }

  @override
  GenericState<int> provideTabIndex() => _currentTabIndex;
}
