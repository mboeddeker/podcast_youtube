import 'package:flutter/material.dart';
import 'package:podcast_app/core/models/chart_item.dart';

class ChartRow extends StatelessWidget {
  final List<ChartItem> items;

  ChartRow({@required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 150,
          child: Column(
            children: <Widget>[
              Image.network(
                item.thumbnails.last,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 8),
              Text(item.artist),
            ],
          ),
        );
      },
    );
  }
}
