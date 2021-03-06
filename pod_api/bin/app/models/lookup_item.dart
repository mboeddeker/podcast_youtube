import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

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

  static DateTime extractReleaseDate(String releaseDate) {
    return DateFormat('yyyy-MM-ddThh:mm:ssZ').parse(releaseDate);
    // 2019-12-03T12:30:00Z
  }

  static LookupResult fromMap(Map<String, dynamic> map) {
    try {
      return LookupResult(
        trackId: map['trackId'],
        artistName: map['artistName'],
        trackName: map['trackName'],
        feedUrl: map['feedUrl'],
        artwork100: map['artworkUrl100'],
        artwork600: map['artworkUrl600'],
        releaseDate: LookupResult.extractReleaseDate(map['releaseDate']),
        genres: map['genres'].map<String>((e) => e.toString()).toList(),
        genreIds: map['genreIds'].map<String>((e) => e.toString()).toList(),
      );
    } catch (e) {
      throw ArgumentError("Can't deserialize LookupResult");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'trackId': this.trackId,
      'artistName': this.artistName,
      'trackName': this.trackName,
      'feedUrl': this.feedUrl,
      'artworkUrl100': this.artwork100,
      'artworkUrl600': this.artwork600,
      'releaseDate': this.releaseDate.toIso8601String(),
      'genres': this.genres,
      'genreIds': this.genreIds,
    };
  }
}
