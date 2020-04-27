import 'package:flutter/material.dart';
import 'package:podcast_app/components/charts_row/chart_card.dart';
import 'package:podcast_app/components/charts_row/charts_row_viewmodel.dart';
import 'package:podcast_app/core/utils/genres.dart';

class ChartRow extends StatelessWidget {
  String genre;
  ChartRow({this.genre});

  @override
  Widget build(BuildContext context) {
    final viewModel = ChartsRowViewModel(genre);
    return FutureBuilder<bool>(
      future: viewModel.loadItems(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data == true) {
          return Container(
            height: 210,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    viewModel.rowTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.chartItems.length,
                      itemBuilder: (context, index) {
                        return ChartCard(viewModel.chartItems[index]);
                      }),
                )
              ],
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      initialData: false,
    );
  }
}
