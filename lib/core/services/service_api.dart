import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:retrofit/retrofit.dart';

part 'service_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  // @POST('/account/Authentication/Login')
  // Future<ResponseLogin> login(@Body() ModelLogin body);

  
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
    
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    
  }

  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    
  }
}
