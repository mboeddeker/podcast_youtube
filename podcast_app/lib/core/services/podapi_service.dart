import 'package:podcast_app/core/models/chart_response.dart';
import 'package:podcast_app/core/services/base_service.dart';
import 'package:podcast_app/di/injection_container.dart';

class PodApiService {
  BaseService service;

  PodApiService({BaseService service}) {
    this.service = service ??= inject<BaseService>();
  }

  Future<ChartResponse> getCharts() async {
    final url = '${service.baseUrl}/charts';
    final response = await service.dio.get(url);
    return ChartResponse.fromJson(response.data);
  }
}
