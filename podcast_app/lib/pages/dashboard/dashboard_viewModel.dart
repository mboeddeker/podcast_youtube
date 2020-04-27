import 'package:podcast_app/core/models/chart_item.dart';
import 'package:podcast_app/core/models/lookup_item.dart';
import 'package:podcast_app/core/utils/generic_state.dart';

abstract class Input {}

abstract class Output {
  GenericState<List<ChartItem>> provideMainCharts();
  GenericState<List<LookupItem>> provideSavedPodcasts();
}

class DashboardViewModel implements Input, Output {
  @override
  GenericState<List<ChartItem>> provideMainCharts() {
    // TODO: implement provideMainCharts
    return null;
  }

  @override
  GenericState<List<LookupItem>> provideSavedPodcasts() {
    // TODO: implement provideSavedPodcasts
    return null;
  }
}
