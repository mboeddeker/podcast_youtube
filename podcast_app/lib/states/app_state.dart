import 'package:podcast_app/core/models/feed_item.dart';
import 'package:podcast_app/core/utils/generic_state.dart';

class AppState {
  GenericState<int> currentPlayTime = GenericState.initWith(0);
  GenericState<bool> playingCast = GenericState.initWith(false);
  GenericState<FeedItem> currentItem = GenericState.initWith(null);
}
