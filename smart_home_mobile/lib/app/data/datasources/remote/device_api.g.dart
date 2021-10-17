// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DeviceApi implements DeviceApi {
  _DeviceApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DeviceModel>> getList(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DeviceModel>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': authorization},
                extra: _extra)
            .compose(_dio.options, '/rooms/{room-id}/devices',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => DeviceModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<int> addDevice(authorization, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms/{room-id}/devices',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<int> editDevice(authorization, roomId, deviceId, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'PUT',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms/$roomId/devices/$deviceId',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<int> deleteDevice(authorization, roomId, deviceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'DELETE',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms/$roomId/devices/$deviceId',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
