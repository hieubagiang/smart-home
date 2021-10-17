import 'package:flutter/material.dart';
import 'package:smart_home/app/common/base/base_view_view_model.dart';
import 'package:smart_home/app/presentation/journey/profile/widgets/menu_item_widget.dart';
import 'package:smart_home/app/presentation/widgets/list_view_widget/list_view_widget.dart';
import 'package:smart_home/app/presentation/widgets/widgets_common.dart';

import 'room_logic.dart';

class RoomManagementPage extends BaseView<RoomManagementController> {
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'room_management'.tr,
      ),
      body: Obx(() {
        return ListViewWidget(
          itemBuilder: (context, index) {
            return MenuItem(
                title: controller.roomList[index].name!,
                onTap: () {
                  print('onTap');
                });
          },
          itemCount: controller.roomList.length,
        );
      }),
    );
  }
}
