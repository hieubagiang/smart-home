import 'package:smart_home_mobile/app/common//helper/api_provider.dart';
import 'package:smart_home_mobile/app/common/constants/constants.dart';
import 'package:smart_home_mobile/app/data/models/base/AppUseCase';

/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class AppUseCase {
  //ApiBaseHelper _service = ApiBaseHelper();
  //todo handle app repository
  ///
  bool checkAvailability(BaseResponse<dynamic> dataResponse) {
    if (!dataResponse.isSuccess &&
        dataResponse.data?.error?.code ==
            ApiConstant.CODE_ACCESS_TOKEN_EXPIRED) {
      onTokenExpired(dataResponse.data!.error!.code!.toString(),
          dataResponse.data?.error?.message ?? "");
      return false;
    }
    if (!dataResponse.isSuccess &&
        dataResponse.data?.error?.code == ApiConstant.CODE_NETWORK_ERROR) {
      onErrorNetwork(dataResponse.data!.error!.code!.toString(),
          dataResponse.data?.error?.message ?? "");
      return false;
    }
    return true;
  }

  void onTokenExpired(String code, String message) {
    //Do Nothing
  }

  void onErrorNetwork(String code, String message) {
    //Do Nothing
  }
}
