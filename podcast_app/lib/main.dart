import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/core/utils/app_shared_preferences.dart';
import 'package:podcast_app/di/injection_container.dart';
import 'package:podcast_app/pages/main_page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setup Dependency Injection
  InjectionContainer.setup();

  // Setup default settings
  await AppSharedPreferences.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final sharedPrefs = inject<AppSharedPreferences>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Podcast App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            )),
        home: loadMainScreen());
  }

  Widget loadMainScreen() {
    return FutureBuilder(
      future: sharedPrefs.get<bool>(AppSharedPreferences.COREDATA_FTU_KEY),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return MainPage();
          default:
            return MainPage();
        }
      },
    );
  }
}
