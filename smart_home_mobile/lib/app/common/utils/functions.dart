import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:smart_home_mobile/app/presentation/utils/strings.dart';
import 'package:smart_home_mobile/app/presentation/utils/utils.dart';

class FunctionUtils {
  /// Common Function
  ///
  /// Log
  static void logWhenDebug(dynamic object, String message) {
    if (kDebugMode) {
      if (object is String) {
        log("$object => $message", name: StringUtils.APP_NAME);
      } else {
        log("${object.runtimeType} => $message", name: StringUtils.APP_NAME);
      }
    }
  }

  ///Convert String to Date
  static String stringToDateFormat(
      {dynamic value, String? format, String? locale}) {
    if (value == null || value.toString().isEmpty) return "";
    String dateString;
    if (locale != null)
      dateString = DateFormat(format, locale)
          .format(DateTime.parse(value.toString()))
          .toString();
    else
      dateString = DateFormat(format)
          .format(DateTime.parse(value.toString()))
          .toString();
    return dateString;
  }

  //Convert Date to String
  static String? dateToDateFormat({DateTime? value, String? format}) {
    if (value == null || format == null) return null;
    String dateString = DateFormat(format).format(value).toString();
    return dateString;
  }

  static Future<bool> checkNetWork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      // return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static String convertFullNameToAvatarText(String? name) {
    final convertName = name
            ?.trim()
            .split(' ')
            .map((e) => e.isNotEmpty ? e.substring(0, 1) : '')
            .toList() ??
        [];
    if (convertName.length > 2) {
      return '${convertName.first}${convertName.last}'.toUpperCase();
    } else {
      return '${convertName.join('')}'.toUpperCase();
    }
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorUtils.secondaryColor,
        textColor: ColorUtils.whiteColor,
        fontSize: FontSizeUtils.toastFontSize);
  }
}
