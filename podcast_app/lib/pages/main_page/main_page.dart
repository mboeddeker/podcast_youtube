import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/components/collapsed_player.dart';
import 'package:podcast_app/core/utils/generic_state.dart';
import 'package:podcast_app/di/injection_container.dart';
import 'package:podcast_app/pages/dashboard/dashboard_page.dart';
import 'package:podcast_app/pages/main_page/main_page_viewModel.dart';
import 'package:podcast_app/states/app_state.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppState>(
      create: (_) => inject<AppState>(),
      child: Provider<MainPageViewModel>(
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
                    child: CollapsedPlayer(),
                  ),
                  body: MaterialApp(
                    title: 'Podcast Appa',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        primarySwatch: Colors.blue,
                        textTheme: GoogleFonts.robotoTextTheme(
                          Theme.of(context).textTheme,
                        )),
                    home: ListenableProvider<GenericState<int>>.value(
                      value: viewModel.provideTabIndex(),
                      child: Consumer<GenericState<int>>(
                        builder: (context, tabIndexState, _) {
                          return tabIndexState.value == 0 ? DashboardPage() : Container();
                        },
                      ),
                    ),
                  ),
                  borderRadius: viewModel.panelRadius,
                ),
              ),
              bottomNavigationBar: ListenableProvider<GenericState<int>>.value(
                value: viewModel.provideTabIndex(),
                child: Consumer<GenericState<int>>(
                  builder: (context, tabIndexState, _) {
                    return BottomNavigationBar(
                      currentIndex: tabIndexState.value,
                      items: [
                        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.library_music), title: Text('Library')),
                        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search'))
                      ],
                      type: BottomNavigationBarType.fixed,
                      onTap: (index) {
                        print(index);
                        viewModel.onChangeTab(index);
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
