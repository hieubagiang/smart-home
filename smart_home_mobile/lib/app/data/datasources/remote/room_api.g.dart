// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RoomApi implements RoomApi {
  _RoomApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<RoomModel>> getRoomList(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RoomModel>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': authorization},
                extra: _extra)
            .compose(_dio.options, '/rooms',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => RoomModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<int> addRoom(authorization, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<int> editRoom(authorization, roomID, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'PUT',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms/$roomID',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<int> deleteRoom(authorization, roomID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
            method: 'DELETE',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/rooms/$roomID',
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
