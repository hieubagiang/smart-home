import 'package:dio/dio.dart';
import 'package:smart_home_mobile/app/common//configs/configurations.dart';
import 'package:smart_home_mobile/app/common//helper/pretty_dio_logger.dart';

  final Dio dio = Dio(BaseOptions(
    connectTimeout: Configurations.connectTimeout,
    receiveTimeout: Configurations.responseTimeout,
    contentType: Configurations.contentType,
    headers: {'Accept': 'application/json'},
    baseUrl: Configurations.host,
  ))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90));

/*

Dio dioProduct = Dio(BaseOptions(
  connectTimeout: Configurations.connectTimeout,
  receiveTimeout: Configurations.responseTimeout,
  contentType: Configurations.contentType,
  headers: {'Accept': 'application/json'},
  baseUrl: Configurations.productHost,
))
  ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
      compact: true,
      maxWidth: 90));
*/
/*
LogInterceptor logInterceptor = LogInterceptor(
  requestHeader: kDebugMode,
  requestBody: kDebugMode,
  responseBody: kDebugMode,
  responseHeader: false,
);*/
