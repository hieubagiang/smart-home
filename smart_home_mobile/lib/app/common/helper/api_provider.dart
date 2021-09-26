import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Getx;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:smart_home_mobile/app/common//extension/file_extension.dart';
import 'package:smart_home_mobile/app/data/models/base/base_response.dart';
import 'package:smart_home_mobile/app/presentation/utils/constants.dart';
import 'package:smart_home_mobile/app/presentation/utils/strings.dart';
import 'package:smart_home_mobile/env.dart';

import 'pretty_dio_logger.dart';
import 'storage_helper.dart';

class Method {
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';
}

class ApiBaseHelper {
  _ApiHandle _api = _ApiHandle();

  Future<BaseResponse> getData(
      {required String url,
      Map<String, dynamic>? params,
      bool withToken = false}) async {
    if (withToken) {
      return await _api.requestWithToken(url, query: params);
    } else {
      return await _api.request(url, query: params);
    }
  }

  Future<BaseResponse> postData(
      {required String url, dynamic body, bool withToken = false}) async {
    if (withToken) {
      return await _api.requestWithToken(url,
          method: Method.POST, params: body);
    } else {
      return await _api.request(url,
          method: Method.POST, params: body, query: body);
    }
  }
}

class _ApiHandle {
  late Dio client;

  _ApiHandle() {
    BaseOptions options = new BaseOptions(
        baseUrl: BuildEnvironment.getInstace().protocol +
            BuildEnvironment.getInstace().domain,
        receiveDataWhenStatusError: true,
        connectTimeout: ApiConstant.CONNECT_TIMEOUT * 1000,
        receiveTimeout: ApiConstant.CONNECT_TIMEOUT * 1000,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        });

    client = new Dio(options);
    client.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future<dynamic> requestWithToken(
    url, {
    String method = Method.GET,
    dynamic params,
    dynamic query,
    Map<String, String> headers = const {},
  }) async {
    final data = await StorageHelper.getDataUser();

    if (data?.token == null) {
      throw new Exception("Token is null");
    }

    return request(url,
        headers: {
          ...headers,
        },
        method: method,
        params: params,
        query: query,
        token: data?.token);
  }

  Future<dynamic> request(String url,
      {String method = Method.GET,
      dynamic params,
      dynamic query,
      Map<String, String> headers = const {},
      String? token}) async {
    BaseResponse responseData = BaseResponse();
    try {
      Response response = await client
          .request(url,
              options: Options(
                method: method,
                headers: headers,
              ),
              data: params is Map && token != null
                  ? method == Method.POST
                      ? {...params, "token": token}
                      : params
                  : params,
              queryParameters: query is Map && token != null
                  ? method == Method.GET
                      ? {...query, "token": token}
                      : query
                  : query)
          .timeout(Duration(seconds: ApiConstant.CONNECT_TIMEOUT));
      responseData = BaseResponse.fromJson(json.encode(response.data));
      responseData.codeHttp = response.statusCode;
      responseData.isSuccess = responseData.result;
      responseData.data = responseData.data;
      return responseData;
    } on DioError catch (e) {
      print("DioError: ${e.toString()}");
      if (e.response == null) {
        var connectivityResult = await (Connectivity().checkConnectivity());

        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          print('Error: Server!');
          responseData.isSuccess = false;
          responseData.data = {
            "error": {
              "code": ApiConstant.CODE_NETWORK_ERROR,
              "message": 'network_error'.tr
            }
          };
          return responseData;
        }
        print('Error: Network!');
        responseData.isSuccess = false;
        responseData.data = {
          "error": {
            "code": ApiConstant.CODE_NETWORK_ERROR,
            "message": 'network_error'.tr
          }
        };

        return responseData;
      }

      var resData = e.response!.data;
      responseData.isSuccess = false;
      responseData.data = {
        "error": {
          "code": e.response!.statusCode,
          "message": !StringUtils.nullOrEmpty(resData)
              ? resData['error']
              : e.response!.statusMessage
        }
      };
      return responseData;
    } catch (e) {
      print('e catch: ${e.toString()}');
      //check has internet connection
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('Error: Server!');
        responseData.isSuccess = false;
        responseData.data = {
          "error": {
            "code": ApiConstant.CODE_NETWORK_ERROR,
            "message": 'network_error'.tr
          }
        };
        return responseData;
      }
      print('Error: Network!');
      responseData.isSuccess = false;
      responseData.data = {
        "error": {
          "code": ApiConstant.CODE_NETWORK_ERROR,
          "message": 'network_error'.tr
        }
      };
      return responseData;
    }
  }

  // multipartRequest
  Future<dynamic> multipartRequest({
    required String method,
    bool withToken = true,
    required String url,
    Map params = const {},
    Map<String, String> headers = const {},
    Function(int, int)? onProgress,
  }) async {
    FormData formData = FormData();

    params.forEach((key, value) {
      if (value is File) {
        List<String> mimeType = lookupMimeType(value.path)!.split('/');
        print('File ${value.name}: ' + mimeType.toString());
        formData.files.add(MapEntry(
          key,
          MultipartFile.fromFileSync(
            value.path,
            filename: value.name,
            contentType: MediaType(mimeType.first, mimeType.last),
          ),
        ));
      } else if (value is List<File>) {
        formData.files.addAll(value.map((file) {
          List<String> mimeType = lookupMimeType(file.path)!.split('/');
          print('File ${file.name}: ' + mimeType.toString());
          return MapEntry(
            key,
            MultipartFile.fromFileSync(
              file.path,
              filename: file.name,
              contentType: MediaType(mimeType.first, mimeType.last),
            ),
          );
        }));
      } else {
        formData.fields.add(MapEntry(key, value));
      }
    });

    if (withToken) {
      return this.requestWithToken(
        url,
        headers: headers,
        method: method,
        params: formData,
      );
    }
    return this.request(
      url,
      headers: headers,
      method: method,
      params: formData,
    );
  }

  // downloadFile
  Future<String> downloadFile(String download, String fileName,
      {String? savePath,
      Function(int receivedBytes, int totalBytes)? onDownloadProgress}) async {
    final httpClient = new HttpClient();
    String downloadUrl = download.replaceFirst('{FILENAME}', fileName);

    final request = await httpClient.getUrl(Uri.parse(downloadUrl));
    request.headers
        .add(HttpHeaders.contentTypeHeader, "application/octet-stream");

    var httpResponse = await request.close();

    int byteCount = 0;
    int totalBytes = httpResponse.contentLength;

    //open new file
    File file = new File(savePath!);
    var raf = file.openSync(mode: FileMode.write);

    Completer completer = new Completer<String>();

    httpResponse.listen(
      (data) {
        byteCount += data.length;

        raf.writeFromSync(data);

        if (onDownloadProgress != null) {
          onDownloadProgress(byteCount, totalBytes);
        }
      },
      onDone: () {
        raf.closeSync();
        completer.complete(file.path);
      },
      onError: (e) {
        raf.closeSync();
        file.deleteSync();
        completer.completeError(e);
      },
      cancelOnError: true,
    );

    return completer.future.toString();
  }
}
