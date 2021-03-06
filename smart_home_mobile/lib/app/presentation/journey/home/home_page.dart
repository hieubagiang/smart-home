import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import 'package:smart_home/app/common/base/base_view_view_model.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/constants.dart';
import 'package:smart_home/app/common/constants/icon_constants.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';
import 'package:smart_home/app/common/utils/date_time.dart';
import 'package:smart_home/app/common/utils/styles.dart';
import 'package:smart_home/app/data/enum/room_enum.dart';
import 'package:smart_home/app/domain/entities/Device.dart';
import 'package:smart_home/app/presentation/journey/home/home_controller.dart';
import 'package:smart_home/app/presentation/journey/home/widgets/device_card_item.dart';

import 'mock_data.dart';

class HomePage extends BaseView<HomeController> {
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          height: 258.h,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 50.h,
              bottom: 16.h,
              left: 16.w,
              right: 16.w),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff669df4), Color(0xff4e80f3)]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: _upperContainer(),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMedium),
            child: Obx(() {
              return ScrollableListTabView(
                style: StyleUtils.style18Bold,
                tabHeight: HeightUtils.heightButtonMedium,
                tabs: _buildListRoom(controller),
              );
            }),
          ),
        ),
        /*_roomCategories(),
        Obx(() {v
          return _applianceGrid(controller.model.value);
        })*/
      ]),
    );
  }

  List<ScrollableListTab> _buildListRoom(HomeController controller) {
    List<ScrollableListTab> listRoomTab = List.empty(growable: true);
    controller.roomList.forEach((roomEntity) {
      listRoomTab.add(ScrollableListTab(
          tab: ListTab(label: Text(roomEntity.name ?? '')),
          body: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(SpaceUtils.spaceSmall),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SpaceUtils.spaceMedium,
                mainAxisSpacing: SpaceUtils.spaceMedium),
            itemBuilder: (BuildContext context, int index) {
              return DeviceCard(
                model: roomEntity.devices?[index],
                onChange: (bool value) {
                  roomEntity.devices?[index].controlDevice(value);
                  roomEntity.devices?[index].pushDeviceStatus();
                },
                changeAutoStatus: (bool) {
                  roomEntity.devices?[index].isAuto =
                      !roomEntity.devices![index].isAuto;
                  roomEntity.devices?[index].pushDeviceStatus();
                },
              );
            },
            itemCount: roomEntity.devices?.length ?? 0, // + 1,
          )));
    });
    return listRoomTab;
  }

  Widget _upperContainer() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateTimeUtils.customGetStringDate(DateTime.now()),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: SpaceUtils.spaceSmall,
                  ),
                  Obx(() {
                    return Text(
                      'hi'.tr + ' ${controller.userData.value?.name ?? ''},',
                      style: StyleUtils.style18Medium
                          .copyWith(color: Colors.white),
                    );
                  }),
                ],
              ),
            ],
          ),
          SizedBox(
            height: SpaceUtils.spaceLarge,
          ),
          Expanded(child: _buildWeatherStats())
        ],
      ),
    );
  }

  Widget _buildWeatherStats() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildStatic(
                FaIcon(
                  FontAwesomeIcons.thermometerQuarter,
                  color: ColorUtils.whiteColor,
                  size: SizeUtils.iconSizeLarge,
                ),
                '${controller.temp.value}${ConstantsUtils.DEGREE_C}'),
          ),
          Expanded(
            child: _buildStatic(
                Image.asset(
                  IconConstants.hygrometerIcon,
                  color: ColorUtils.whiteColor,
                  height: SizeUtils.iconSizeLarge + 8.w,
                  width: SizeUtils.iconSizeLarge + 8.w,
                ),
                '${controller.humidity.value}${ConstantsUtils.PERCENT}'),
          ),
        ],
      );
    });
  }

  Row _buildStatic(Widget prefixIcon, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SpaceUtils.spaceSmall),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon,
                SizedBox(
                  width: SpaceUtils.spaceSmall,
                ),
                Text(
                  value,
                  style: StyleUtils.style18Bold.copyWith(
                      fontSize: 36.sp, color: ColorUtils.secondaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Device> getRoomDevice(RoomType type) {
    print(type);
    switch (type) {
      case RoomType.LIVING_ROOM:
        print('$type => ${MockData.devicesOfLivingRoom}');
        return MockData.devicesOfLivingRoom;
      case RoomType.BED_ROOM:
        print('$type => ${MockData.devicesOfBedRoom}');
        return MockData.devicesOfBedRoom;
      case RoomType.KITCHEN:
        print('$type => ${MockData.devicesOfKitchen}');
        return MockData.devicesOfKitchen;
      case RoomType.BATH_ROOM:
        print('$type => ${MockData.devicesOfBathRoom}');
        return MockData.devicesOfBathRoom;
      case RoomType.YARD:
        print('$type => ${MockData.devicesOfBathRoom}');
        return MockData.devicesOfYard;
    }
  }
}
