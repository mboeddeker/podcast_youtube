import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/di/injection_container.dart';
import 'package:podcast_app/pages/dashboard/dashboard_page.dart';
import 'package:podcast_app/pages/main_page/main_page_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MainPageViewModel>(
      create: (_) => inject<MainPageViewModel>(),
      child: Consumer<MainPageViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Material(
              child: SlidingUpPanel(
                backdropEnabled: true,
                minHeight: 75,
                backdropOpacity: 1.0,
                maxHeight: MediaQuery.of(context).size.height - 75,
                panel: Container(
                    child: Center(
                  child: Text("This is the sliding Widget"),
                )),
                collapsed: Container(
                  decoration: BoxDecoration(
                    borderRadius: viewModel.panelRadius,
                  ),
                ),
                body: MaterialApp(
                  title: 'Podcast Appa',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                      textTheme: GoogleFonts.robotoTextTheme(
                        Theme.of(context).textTheme,
                      )),
                  home: DashboardPage(),
                ),
                borderRadius: viewModel.panelRadius,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('home')),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('home')),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('home'))
            ]),
          );
        },
      ),
    );
  }
}
