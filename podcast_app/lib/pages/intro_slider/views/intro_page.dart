import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/core/utils/generic_state.dart';
import 'package:podcast_app/pages/intro_slider/viewModels/intro_page_viewModel.dart';
import 'package:podcast_app/styles/textstyles.dart';
import 'package:provider/provider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Provider<IntroPageViewModel>(
      create: (_) => IntroPageViewModel(),
      child: Consumer<IntroPageViewModel>(
        builder: (BuildContext context, IntroPageViewModel viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: _buildView(context, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildView(BuildContext context, IntroPageViewModel viewModel) {
    return ListenableProvider<GenericState<int>>(
      create: (_) => viewModel.provideIndex(),
      child: Consumer<GenericState<int>>(
        builder: (context, currentIndex, _) {
          return Stack(
            children: [
              TransformerPageView(
                pageSnapping: viewModel.pageSnappingAllowed(),
                controller: viewModel.provideIndexController(),
                loop: viewModel.loopAllowed(),
                itemCount: viewModel.sliderTitles().length,
                onPageChanged: (index) => viewModel.onPageChanged(index),
                transformer: PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ParallaxContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
                            child: Text(
                              viewModel.sliderTitles()[currentIndex.value],
                              style: AppTextStyles.heading1,
                            ),
                          ),
                          position: info.position,
                          opacityFactor: 1,
                          translationFactor: 100.0,
                        ),
                        SizedBox(height: 32),
                        ParallaxContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Text(
                              viewModel.sliderSubTitles()[currentIndex.value],
                              style: AppTextStyles.heading2,
                            ),
                          ),
                          position: info.position,
                          opacityFactor: 1,
                          translationFactor: 600.0,
                        ),
                        SizedBox(height: 24),
                        ParallaxContainer(
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Image.asset(
                              viewModel.sliderImages()[currentIndex.value],
                              fit: BoxFit.contain,
                            ),
                          ),
                          position: info.position,
                          opacityFactor: 1,
                          translationFactor: 900.0,
                        ),
                        currentIndex.value == 2
                            ? //TODO: this a single Widget
                            ParallaxContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    MaterialButton(
                                      height: 50,
                                      minWidth: 150,
                                      onPressed: () {},
                                      child: Text('OKAY'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(25.0),
                                      ),
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                    )
                                  ],
                                ),
                                position: info.position,
                                opacityFactor: 1,
                                translationFactor: 900.0,
                              )
                            : Container(),
                      ],
                    ),
                  );
                }),
              ),
              currentIndex.value != 2
                  ? Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: currentIndex.value.toDouble(),
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
