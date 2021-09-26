/*
 * @Author: NgaNT 
 * @Date: 2021-06-14 18:04:07 
 * @Last Modified by: NgaNT
 * @Last Modified time: 2021-07-01 11:20:09
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_mobile/app/presentation/utils/utils.dart';

import '../utils/space.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Color colorText;
  final Function()? onClick;
  final double spaceVertical;
  final bool autoSizeFollowText;
  final Decoration? decoration;
  final bool clickEnable;
  final double? border;
  final Color? colorBorder;

  const ButtonWidget(
      {Key? key,
      this.color = ColorUtils.primaryColor,
      this.text = "",
      this.colorText = Colors.white,
      this.onClick,
      this.decoration,
      this.clickEnable = true,
      this.spaceVertical = 16,
      this.autoSizeFollowText = false,
      this.border,
      this.colorBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: InkWell(
        splashColor: clickEnable ? null : Colors.transparent,
        onTap: onClick,
        child: Ink(
          width: autoSizeFollowText ? null : size.width,
          decoration: decoration ??
              BoxDecoration(
                border: Border.all(color: colorBorder ?? color, width: 2),
                borderRadius: BorderRadius.circular(
                  border ?? BorderUtils.borderButton,
                ),
                color: color,
              ),
          child: Container(
            padding: EdgeInsets.only(
                top: spaceVertical,
                bottom: spaceVertical + 2, //
                left: autoSizeFollowText ? SpaceUtils.spaceSmall : 0,
                right: autoSizeFollowText ? SpaceUtils.spaceSmall : 0),
            child: Center(
              child: Text(
                text,
                style: StyleUtils.style18Bold.copyWith(color: colorText),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
