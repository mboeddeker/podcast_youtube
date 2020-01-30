import 'package:flutter/foundation.dart';
import 'package:podcast_app/core/models/chart_response.dart';
import 'package:podcast_app/core/models/feed.dart';
import 'package:podcast_app/core/models/lookup_response.dart';
import 'package:podcast_app/core/models/result.dart';
import 'package:podcast_app/core/services/api_options.dart';
import 'package:podcast_app/core/services/base_service.dart';

class PodApiService {
  BaseService service;

  PodApiService({this.service});

  Future<Result<ChartResponse>> getCharts(
      {@required ChartOptions options}) async {
    final url = '${service.baseUrl}${options.getQueryPath()}';
    try {
      final response = await service.dio.get(url);
      return Result.success(
        data: ChartResponse.fromJson(response.data),
        message: 'Success',
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  Future<Result<LookupResponse>> getLookup(
      {@required LookupOptions options}) async {
    final url = '${service.baseUrl}${options.getQueryPath()}';
    try {
      final response = await service.dio.get(url);
      return Result.success(
        data: LookupResponse.fromJson(response.data),
        message: 'Success',
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  Future<Result<LookupResponse>> search(
      {@required SearchOptions options}) async {
    final url = '${service.baseUrl}${options.getQueryPath()}';
    try {
      final response = await service.dio.get(url);
      return Result.success(
        data: LookupResponse.fromJson(response.data),
        message: 'Success',
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  Future<Result<Feed>> getFeed({@required FeedOptions options}) async {
    final url = '${service.baseUrl}${options.getQueryPath()}';
    try {
      final response = await service.dio.get(url);
      return Result.success(
        data: Feed.fromJson(response.data),
        message: 'Success',
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }
}
