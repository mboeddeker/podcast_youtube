import 'package:flutter/foundation.dart';
import 'package:podcast_app/core/extensions/string_extensions.dart';

abstract class ApiOptions {
  String getQueryPath();
}

class ChartOptions extends ApiOptions {
  String language;
  int limit;
  bool explicit;
  bool withLookup;
  String genre;

  ChartOptions({
    this.language = 'de',
    this.limit = 30,
    this.explicit = true,
    this.withLookup = false,
    this.genre,
  });

  @override
  String getQueryPath() {
    return '/charts?langauge=${this.language}&limit=${this.limit}&explicit=${this.explicit}&withLookup=${this.withLookup}${this.genre != null ? "&genre=${this.genre}" : ""}';
  }
}

class SearchOptions extends ApiOptions {
  String searchTerm;
  String language;
  bool explicit;

  SearchOptions(
      {@required this.searchTerm, this.language = 'de', this.explicit = true});

  @override
  String getQueryPath() {
    return '/search?searchTerm=${this.searchTerm}&language=${this.language}&explicit=${this.explicit}'
        .asUrl();
  }
}

class LookupOptions extends ApiOptions {
  String id;

  LookupOptions({@required this.id});

  @override
  String getQueryPath() {
    return '/charts/lookup?id=${this.id}';
  }
}

class FeedOptions extends ApiOptions {
  String id;

  FeedOptions({@required this.id});

  @override
  String getQueryPath() {
    return '/feed?id=${this.id}';
  }
}
