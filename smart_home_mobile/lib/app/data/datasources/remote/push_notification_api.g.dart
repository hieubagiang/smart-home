// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PushNotificationApi implements PushNotificationApi {
  _PushNotificationApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://fcm.googleapis.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> sendPushNotification(authorization, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': authorization},
            extra: _extra)
        .compose(_dio.options, '/fcm/send',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
