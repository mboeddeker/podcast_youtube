import 'package:flutter/foundation.dart';

class GenericState<T> with ChangeNotifier {
  T _value;

  GenericState() : _value = null;

  GenericState.initWith(this._value);

  T get value => _value;

  set value(T value) {
    if (_value == value) return;

    _value = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
