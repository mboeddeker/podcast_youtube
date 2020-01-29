import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/core/models/chart_item.dart';
import 'package:uuid/uuid.dart';

class ChartResponse extends Equatable {
  final String _id = Uuid().v1();
  final List<ChartItem> entries;

  ChartResponse({@required this.entries});

  static ChartResponse fromJson(Map<String, dynamic> map) {
    return ChartResponse(
        entries: map['entries']
            .map<ChartItem>((entry) => ChartItem.fromJson(entry))
            .toList());
  }

  @override
  List<Object> get props => [_id];
}
