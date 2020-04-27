import 'package:podcast_app/core/models/chart_item.dart';
import 'package:podcast_app/core/services/api_options.dart';
import 'package:podcast_app/core/services/podapi_service.dart';
import 'package:podcast_app/core/utils/generic_state.dart';
import 'package:podcast_app/core/utils/genres.dart';
import 'package:podcast_app/di/injection_container.dart';

abstract class Input {
  Future<bool> loadItems();
}

abstract class Output {
  String rowTitle;
  List<ChartItem> chartItems;
  GenericState<bool> provideItemsLoaded();
}

class ChartsRowViewModel implements Input, Output {
  String genre;
  PodApiService _service = inject<PodApiService>();

  GenericState<bool> _itemsLoadedState = GenericState.initWith(false);

  ChartsRowViewModel(this.genre);

  @override
  String rowTitle => Genre.books

  @override
  List<ChartItem> chartItems = [];

  @override
  GenericState<bool> provideItemsLoaded() => _itemsLoadedState;

  @override
  Future<bool> loadItems() async {
    final result = await _service.getCharts(options: ChartOptions(genre: genre));
    return result.when(
      success: (chartsResponse) {
        chartItems = chartsResponse.data.entries;
        return true;
      },
      error: (err) {
        print(err);
        return false;
      },
    );
  }
}
