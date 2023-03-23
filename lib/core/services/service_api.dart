import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xcoin2/core/models/model_status.dart';

import '../models/model_coin.dart';
import '../models/response_market_list.dart';

part 'service_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('trending.json')
  Future<ResponseTrendingCoin> getTrendingCoins();
  
  @GET('market/{coinListType}/marketList.json')
  Future<ResponseMarketList> getMarketList(@Path() String coinListType);
  
  @GET('market/status.json')
  Future<ModelStatus> getMarketStatus();
}

class ServiceApi extends ChangeNotifier {
  late Dio dio;

  late ApiClient _client;

  ApiClient get client => _client;

  ServiceApi() {
    createDio();
  }

  void createDio() {
    dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 30)));

    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (_) => HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse, onError: onError));
    dio.options.headers.addEntries([const MapEntry('Content-Type', 'application/json')]);
    _client = ApiClient(dio, baseUrl: FlavorConfig.instance.variables['baseUrl']);
  }

  Future<void> onError(DioError e, ErrorInterceptorHandler handler) async {
    handler.next(e);
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
