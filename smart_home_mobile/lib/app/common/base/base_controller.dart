import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_home_mobile/app/common/utils/functions.dart';
import 'package:smart_home_mobile/app/common//helper/storage_helper.dart';
import 'package:smart_home_mobile/app/domain/repositories/repositories.dart';
import 'package:smart_home_mobile/app/presentation/routes/app_pages.dart';
import 'package:smart_home_mobile/app/common/constants/constants.dart';
import 'package:smart_home_mobile/app/common/utils/strings.dart';

import 'base_common_widgets.dart';
import 'widget_state.dart';

export 'package:get/get.dart';

/// createdby Daewu Bintara
/// Friday, 1/29/21

///
/// --------------------------------------------
/// [Example]
///
/// class HomeController extends BaseController {
///
///   var count = 0.obs;
///
///   @override
///   void onInit() {
///     super.onInit();
///   }
///
///   void increment() => count ++;
///
/// }
///
/// RECOMENDED FOR your [Controller].
/// Please extends to your [Controller].
/// read the [Example] above.
class BaseController extends GetxController
    with
        BaseCommonWidgets,
        WidgetState,
        ScreenState,
        FunctionUtils,
        AppUseCase {
  final box = GetStorage();
  bool withScrollController = false;
  late ScrollController scrollController;
  RxBool isLoadMore = false.obs;
  bool isEnableLoadMore = false;
  int _lastTimeClick = 0;

  void setEnableScrollController(bool value) => withScrollController = value;

  @override
  void onInit() {
    super.onInit();
    if (withScrollController) {
      FunctionUtils.logWhenDebug(
          "SCROLL CONTROLLER ENABLE on ${Get.currentRoute}",
          withScrollController.toString());
      scrollController = ScrollController();
      scrollController..addListener(_scrollListener);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onLoadMore() {
    isLoadMore.value = false;
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (isEnableLoadMore && !isLoadMore.value) {
        isLoadMore.value = true;
        onLoadMore();
      }
    }
  }

  bool isDoubleClick() {
    var timeNow = DateTime.now().millisecondsSinceEpoch;
    print("HIHI" + (timeNow - _lastTimeClick).abs().toString());
    if ((timeNow - _lastTimeClick).abs() >=
        ConstantsUtils.DURATION_TIME_CLICKABLE) {
      _lastTimeClick = timeNow;
      return false;
    }
    return true;
  }

  @override
  void onTokenExpired(String code, String message) {
    super.onTokenExpired(code, message);
    showDialogMessage(StringUtils.getMessageErrorFromServer(message, code), () {
      logOut();
    });
  }

  @override
  void onErrorNetwork(String code, String message) {
    super.onErrorNetwork(code, message);
    showDialogMessage(
        StringUtils.getMessageErrorFromServer(message, code), null);
  }

  Future<void> logOut() async {
    await StorageHelper.clearUserLogin();
    Get.offAllNamed(Routes.LOGIN);
  }
}
