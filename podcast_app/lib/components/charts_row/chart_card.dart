import 'package:flutter/material.dart';
import 'package:podcast_app/core/models/chart_item.dart';

class ChartCard extends StatelessWidget {
  final ChartItem item;
  ChartCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 210,
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              item.thumbnails.last,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            item.title,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(fontSize: 12),
          ),
          Text(
            item.artist,
            maxLines: 1,
          ),
          SizedBox(height: 8),
          Divider()
        ],
      ),
    );
  }
}
