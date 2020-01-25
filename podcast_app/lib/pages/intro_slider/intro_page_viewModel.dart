import 'package:podcast_app/core/utils/generic_state.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

abstract class Input {
  onPageChanged(int index);

  onIntroFinished();
}

abstract class Output {
  GenericState<int> provideIndex();

  IndexController provideIndexController();

  List<String> sliderImages();

  List<String> sliderTitles();

  List<String> sliderSubTitles();

  bool pageSnappingAllowed();

  bool loopAllowed();
}

class IntroPageViewModel implements Input, Output {
  IndexController _indexController = IndexController();

  GenericState<int> _currentIndex = GenericState<int>.initWith(0);

  @override
  onPageChanged(int index) {
    _currentIndex.value = index;
    _currentIndex.notifyListeners();
  }

  @override
  onIntroFinished() {
    print('on intro finished');
  }

  @override
  bool pageSnappingAllowed() => true;

  @override
  bool loopAllowed() => false;

  @override
  GenericState<int> provideIndex() => _currentIndex;

  @override
  IndexController provideIndexController() => _indexController;

  @override
  List<String> sliderImages() => [
        'assets/images/welcome_image_one.png',
        'assets/images/welcome_image_two.png',
        'assets/images/welcome_image_three.png'
      ];

  // TODO: Add translation files.
  @override
  List<String> sliderTitles() => [
        'Enjoy your daily dose of podcasts',
        'Download your favorites and listen to them offline',
        'And if you like us, rate this app on the app stores',
      ];

  // TODO: Maybe coming soon. I'm not sure.
  @override
  List<String> sliderSubTitles() =>
      ['Search for the next big top podcasts for every genre.', '', ''];
}
