import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import '../../bin/app/services/base_service.dart';
import 'mock_adapter.dart';

class MockBaseService extends BaseService {
  @override
  Dio dio = Dio();

  @override
  String itunesBaseUrl = MockAdapter.mockBase;

  MockBaseService() {
    dio.httpClientAdapter = MockAdapter();
  }
}
