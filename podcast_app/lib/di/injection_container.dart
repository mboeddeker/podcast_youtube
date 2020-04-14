import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:podcast_app/core/services/base_service.dart';
import 'package:podcast_app/core/services/podapi_service.dart';
import 'package:podcast_app/core/utils/app_shared_preferences.dart';
import 'package:podcast_app/pages/main_page/main_page_viewModel.dart';
import 'package:podcast_app/states/app_state.dart';

class InjectionContainer {
  static void setup() {
    final container = Container();
    // App Router
    container.registerSingleton((c) => Router());
    // Shared Preferences
    container.registerInstance(AppSharedPreferences());
    // BaseService
    container.registerInstance(BaseService());
    // PodApi Service
    container.registerInstance(PodApiService(service: inject<BaseService>()));

    // VIEWMODELS
    // MainPageViewModel
    container.registerSingleton((c) => MainPageViewModel());

    // AppState
    container.registerSingleton((c) => AppState());
  }
}

T inject<T>() {
  var obj = Container().resolve<T>();
  if (kDebugMode) {
    print('DI: Type=${obj.runtimeType.toString()}, hashCode=${obj.hashCode}');
  }
  return obj;
}
