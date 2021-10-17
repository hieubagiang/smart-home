import 'package:flutter/material.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/constants/layout_constant.dart';
import 'package:smart_home/app/common/utils/styles.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? leading;

  const MenuItem({
    Key? key,
    required this.title,
    required this.onTap,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingHorizontalSmall),
        decoration: BoxDecoration(
          color: ColorUtils.whiteColor,
          borderRadius: BorderRadius.circular(BorderUtils.borderButton),
          boxShadow: [
            BoxShadow(

                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, SpaceUtils.spaceSmall),
                color: ColorUtils.greyColor),
          ],
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: StyleUtils.style14Medium,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: SizeUtils.iconSize,
            color: ColorUtils.blackColor,
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: LayoutConstants.paddingHorizontalSmall),
        ),
      ),
    );
  }
}
