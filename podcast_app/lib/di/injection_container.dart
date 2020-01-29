import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:podcast_app/core/services/base_service.dart';
import 'package:podcast_app/core/utils/app_shared_preferences.dart';

class InjectionContainer {
  static void setup() {
    final container = Container();
    // App Router
    container.registerSingleton((c) => Router());
    // Shared Preferences
    container.registerInstance(AppSharedPreferences());
    // BaseService
    container.registerInstance(BaseService());
  }
}

T inject<T>() {
  var obj = Container().resolve<T>();
  if (kDebugMode) {
    print('DI: Type=${obj.runtimeType.toString()}, hashCode=${obj.hashCode}');
  }
  return obj;
}
