import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/core/models/lookup_item.dart';
import 'package:uuid/uuid.dart';

class LookupResponse extends Equatable {
  final String _id = Uuid().v1();
  final int resultCount;
  final List<LookupItem> results;

  LookupResponse({@required this.resultCount, @required this.results});

  static LookupResponse fromJson(Map<String, dynamic> map) {
    return LookupResponse(
      resultCount: map['resultCount'],
      results: map['results'].map((item) => LookupItem.fromJson(item)).toList(),
    );
  }

  @override
  List<Object> get props => [_id];
}
