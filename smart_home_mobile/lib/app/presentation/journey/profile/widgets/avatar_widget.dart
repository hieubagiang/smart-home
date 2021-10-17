import 'package:flutter/material.dart';
import 'package:smart_home/app/common/constants/image_constants.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(SizeUtils.avatarSize),
          child: Container(
              height: SizeUtils.avatarSize,
              width: SizeUtils.avatarSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: Icon(Icons.person,size: SizeUtils.avatarSize,)),
        ),
        // Container(
        //   height: LayoutConstants.smallIconBtnSize,
        //   width: LayoutConstants.smallIconBtnSize,
        //   margin: EdgeInsets.all(3),
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 0,
        //       blurRadius: 5, // changes position of shadow
        //     ),
        //   ], shape: BoxShape.circle, color: AppColor.primaryColor),
        //   child: Icon(
        //     Icons.camera_alt_outlined,
        //     size: LayoutConstants.iconSize,
        //     color: AppColor.white,
        //   ),
        // )
      ],
    );
  }

}