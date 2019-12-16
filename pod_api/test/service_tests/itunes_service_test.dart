import 'package:test/test.dart';
import '../../bin/app/services/itunes_service.dart';
import '../utils/mock_service.dart';

void main() {
  ItunesService sut;

  tearDown(() {
    sut = null;
  });

  test('Getting Charts works', () async {
    sut = ItunesService(MockBaseService());
    final chartsResponse = await sut.getTopPodcast(language: 'de', limit: 10, explicit: true);
    expect(chartsResponse.entries.length, equals(2));
  });

  test('Getting Charts fails', () async {
    sut = ItunesService(MockBaseService());
    final chartsResponse = await sut.getTopPodcast(language: 'de', limit: 10, explicit: true);
    expect(chartsResponse.entries.length, equals(2));
  });
}
