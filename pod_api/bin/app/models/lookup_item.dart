import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'dart:core';

class LookupResponse {
  final int resultCount;
  final List<LookupResult> results;

  LookupResponse({@required this.resultCount, @required this.results});

  LookupResponse.fromMap(Map<String, dynamic> map)
      : resultCount = map['resultCount'],
        results =
            map['results'].map<LookupResult>((element) => LookupResult.fromMap(element)).toList();
}

class LookupResult {
  final int trackId;
  final String artistName;
  final String trackName;
  final String feedUrl;
  final String artwork100;
  final String artwork600;
  final DateTime releaseDate;
  final List<String> genres;
  final List<String> genreIds;

  LookupResult({
    @required this.trackId,
    @required this.artistName,
    @required this.trackName,
    @required this.feedUrl,
    @required this.artwork100,
    @required this.artwork600,
    @required this.releaseDate,
    @required this.genres,
    @required this.genreIds,
  });

  LookupResult.fromMap(Map<String, dynamic> map)
      : trackId = map['trackId'],
        artistName = map['artistName'],
        trackName = map['trackName'],
        feedUrl = map['feedUrl'],
        artwork100 = map['artwork100'],
        artwork600 = map['artwork600'],
        releaseDate = _extractReleaseDate(map['releaseDate']),
        genres = map['genres'].map<String>((e) => e.toString()).toList(),
        genreIds = map['genreIds'].map<String>((e) => e.toString()).toList();

  static DateTime _extractReleaseDate(String releaseDate) {
    return DateFormat('yyyy-MM-ddThh:mm:ssZ').parse(releaseDate);
    // 2019-12-03T12:30:00Z
  }
}
