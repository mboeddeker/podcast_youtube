import 'lookup_item.dart';
import 'package:meta/meta.dart';

class LookupResponse {
  final int resultCount;
  final List<LookupResult> results;

  LookupResponse({@required this.resultCount, @required this.results});

  static LookupResponse fromMap(Map<String, dynamic> map) {
    try {
      return LookupResponse(
        resultCount: map['resultCount'],
        results:
            map['results'].map<LookupResult>((element) => LookupResult.fromMap(element)).toList(),
      );
    } catch (e) {
      return LookupResponse(resultCount: 0, results: List());
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'resultCount': this.resultCount,
      'results': this.results.map((result) => result.toMap()).toList(),
    };
  }
}
