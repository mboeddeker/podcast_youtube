import 'package:test/test.dart';
import '../../bin/app/models/lookup_item.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  var dto = Map<String, dynamic>();

  setUp(() async {
    final file = File('test_resources/lookup.json');
    dto = json.decode(await file.readAsString());
    expect(dto.length > 0, equals(true));
  });

  tearDown(() {
    dto = null;
  });

  test('Parse LookupResponse from Json', () {
    final response = LookupResponse.fromMap(dto);
    expect(response.resultCount, equals(1));
    expect(response.results.first, isNotNull);
    expect(response.results.first.trackId, equals(1374777077));
  });
}
