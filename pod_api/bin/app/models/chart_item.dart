import 'package:meta/meta.dart';

class ChartItem {
  final String id;
  final String title;
  final String summary;
  final String artist;
  final String thumbnail;
  final String releaseDate;
  final String category;

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.summary,
    @required this.artist,
    @required this.thumbnail,
    @required this.releaseDate,
    @required this.category,
  });
}
