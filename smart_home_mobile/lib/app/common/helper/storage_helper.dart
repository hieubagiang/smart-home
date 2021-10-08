import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:smart_home_mobile/app/common/constants/constants.dart';
import 'package:smart_home_mobile/app/common/utils/functions.dart';
import 'package:smart_home_mobile/app/data/models/authentication/login_model.dart';

class StorageHelper {
  static GetStorage box = GetStorage();

  static Future<void> setDataUser(LoginModel? model) async {
    if (model == null) {
      await clearUserLogin();
    } else {
      await box.write(
        ConstantsUtils.ACCESS_TOKEN_KEY,
        jsonEncode(model.toJson()),
      );
      FunctionUtils.logWhenDebug(StorageHelper, 'saved');
    }
  }

  static Future<LoginModel?> getDataUser() async {
    if (box.read(ConstantsUtils.ACCESS_TOKEN_KEY) != null) {
      String accessToken = await box.read(ConstantsUtils.ACCESS_TOKEN_KEY);
      FunctionUtils.logWhenDebug('StorageHelper', '$accessToken');

      return LoginModel.fromJson(jsonDecode(accessToken));
    }
    FunctionUtils.logWhenDebug('StorageHelper', '${box.read(ConstantsUtils.ACCESS_TOKEN_KEY)}');

    return null;
  }

  static Future<void> clearUserLogin() async {
    await box.remove(ConstantsUtils.ACCESS_TOKEN_KEY);
  }

  static Future<String?> getLoginId() async {
    if (box.read(ConstantsUtils.LOGIN_ID_KEY) != null) {
      String data = await box.read(ConstantsUtils.LOGIN_ID_KEY);
      return jsonDecode(data);
    }
    return null;
  }

  static Future<void> setLoginId(String? loginId) async {
    await box.write(
      ConstantsUtils.LOGIN_ID_KEY,
      jsonEncode(loginId ?? ""),
    );
  }


}
