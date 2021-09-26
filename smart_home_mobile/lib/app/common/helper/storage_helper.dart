import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:smart_home_mobile/app/data/models/response/login/login_response.dart';
import 'package:smart_home_mobile/app/presentation/utils/constants.dart';

class StorageHelper {
  static GetStorage box = GetStorage();

  static Future<void> setDataUser(LoginResponse? loginResponse) async {
    if (loginResponse == null) {
      await clearUserLogin();
    } else {
      await box.write(
        ConstantsUtils.USER_LOGIN_KEY,
        jsonEncode(loginResponse.toJson()),
      );
    }
  }

  static Future<LoginResponse?> getDataUser() async {
    if (box.read(ConstantsUtils.USER_LOGIN_KEY) != null) {
      String authEncode = await box.read(ConstantsUtils.USER_LOGIN_KEY);
      return LoginResponse.fromJson(jsonDecode(authEncode));
    }
    return null;
  }

  static Future<void> clearUserLogin() async {
    await box.remove(ConstantsUtils.USER_LOGIN_KEY);
  }

  static Future<String?> getTenant() async {
    if (box.read(ConstantsUtils.LOGIN_TENANT_KEY) != null) {
      String data = await box.read(ConstantsUtils.LOGIN_TENANT_KEY);
      return jsonDecode(data);
    }
    return null;
  }

  static Future<void> setTenant(String? tenant) async {
    await box.write(
      ConstantsUtils.LOGIN_TENANT_KEY,
      jsonEncode(tenant ?? ""),
    );
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

  static Future<int?> getLoginType() async {
    if (box.read(ConstantsUtils.LOGIN_TYPE_KEY) != null) {
      String data = await box.read(ConstantsUtils.LOGIN_TYPE_KEY);
      return jsonDecode(data);
    }
    return null;
  }

  static Future<void> setLoginType(int tenant) async {
    await box.write(
      ConstantsUtils.LOGIN_TYPE_KEY,
      jsonEncode(tenant),
    );
  }
}
