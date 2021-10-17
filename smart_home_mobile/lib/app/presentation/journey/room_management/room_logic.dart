import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';
import 'package:smart_home/app/presentation/journey/room_management/use_case/impl/room_management_use_case_impl.dart';
import 'package:smart_home/app/presentation/journey/room_management/use_case/room_management_use_case.dart';

class RoomManagementController extends BaseController {
  final RoomManagementUseCase useCase = Get.find<RoomManagementUseCaseImpl>();

  RxList<RoomEntity> roomList = RxList.empty();

  void onInit(){
    super.onInit();
    getRoomList();
  }
  Future<void> getRoomList() async {
    roomList.value = await useCase.getRoomList();
    print(roomList);
  }
}
