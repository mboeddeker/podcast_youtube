import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';


class InjectionContainer {
  void setup() {
    final container = Container();
  }
}

T inject<T>() {
  var obj = Container().resolve<T>();
  if (kDebugMode) {
    print('DI: Type=${obj.runtimeType.toString()}, hashCode=${obj.hashCode}');
  }
  return obj;
}
