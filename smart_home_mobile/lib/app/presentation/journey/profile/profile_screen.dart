import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';
import 'package:smart_home/app/common/utils/styles.dart';
import 'package:smart_home/app/presentation/journey/home/home_controller.dart';
import 'package:smart_home/app/presentation/journey/profile/profile_controller.dart';
import 'package:smart_home/app/presentation/journey/profile/widgets/avatar_widget.dart';
import 'package:smart_home/app/presentation/journey/profile/widgets/menu_item_widget.dart';
import 'package:smart_home/app/presentation/routes/app_pages.dart';
import 'package:smart_home/app/presentation/widgets/appbar_widget/appbar_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBarWidget(
        leading: _buildLeadingAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SpaceUtils.spaceMedium,
            vertical: SpaceUtils.spaceMedium),
        child: Column(
          children: [
            _buildProfileInfo(),
            SizedBox(
              height: SpaceUtils.spaceExtraLarge,
            ),
            MenuItem(
                leading: Icon(Icons.room),
                title: 'room_management'.tr,
                onTap: ()=> Get.toNamed(RouteList.ROOM_MANAGEMENT)),
            SizedBox(
              height: SpaceUtils.spaceMedium,
            ),
            MenuItem(
              leading: Icon(Icons.star),
              title: 'rate_me'.tr,
              onTap: () {},
            ),
            SizedBox(
              height: SpaceUtils.spaceMedium,
            ),
            MenuItem(
              leading: Icon(Icons.info),
              title: 'about_me'.tr,
              onTap: () {},
            ),
            SizedBox(
              height: SpaceUtils.spaceMedium,
            ),
            MenuItem(
              leading: Icon(Icons.logout),
              title: 'logout'.tr,
              onTap: () {
                Get.find<HomeController>().onTapLogout();
              },
            ),
          ],
        ),
      ),
    );
  }

  Row _buildProfileInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarWidget(),
        SizedBox(
          width: SpaceUtils.spaceMedium,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phạm Doãn Hiếu',
                style: StyleUtils.style18Bold
                    .copyWith(color: ColorUtils.primaryColor),
              ),
              Text(
                'admin@hieuit.me'.tr,
                style: StyleUtils.style14Medium
                    .copyWith(color: ColorUtils.thirdColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding _buildLeadingAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: LayoutConstants.paddingHorizontalApp),
      child: Text(
        'settings'.tr,
        style: StyleUtils.style18Bold,
      ),
    );
  }
}
