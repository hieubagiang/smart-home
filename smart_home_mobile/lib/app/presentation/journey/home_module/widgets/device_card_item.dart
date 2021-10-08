import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home_mobile/app/common/base/base_view_view_model.dart';
import 'package:smart_home_mobile/app/common/constants/colors_constant.dart';
import 'package:smart_home_mobile/app/common/constants/icon_constants.dart';
import 'package:smart_home_mobile/app/common/constants/layout_constant.dart';
import 'package:smart_home_mobile/app/common/utils/functions.dart';
import 'package:smart_home_mobile/app/domain/entities/Device.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    required this.model,
    required this.onChange,
    required this.changeAutoStatus,
  }) : super(key: key);

  final Device? model;
  final Function(bool)? onChange;
  final Function(bool)? changeAutoStatus;
  static int count = 0;

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.symmetric(
          horizontal: SpaceUtils.spaceSmall * 1.5,
          vertical: SpaceUtils.spaceSmall),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, SpaceUtils.spaceSmall),
                color: ColorUtils.greyColor),
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: (widget.model != null && widget.model!.isEnable)
                  ? [Color(0xff669df4), Color(0xff4e80f3)]
                  : [ColorUtils.whiteColor, ColorUtils.whiteColor]),
          borderRadius: BorderRadius.circular(20)),
      child: widget.model == null
          ? _buildAddIcon()
          : _buildDeviceInfo(widget.model!),
    );
  }

  Column _buildDeviceInfo(Device model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            model.leftIcon is String
                ? Image.asset(
              IconConstants.waterHeaterIcon,
              color: ColorUtils.whiteColor,
              height: HeightUtils.iconSizeLarge,
              width: HeightUtils.iconSizeLarge,
            )
                : Icon(model.leftIcon,
                color: model.isEnable ? Colors.white : Color(0xffa3a3a3)),
            FlutterSwitch(
                width: 60.w,
                height: 35.h,
                valueFontSize: 14.sp,
                toggleSize: 16.w,
                value: model.isEnable,
                padding: SpaceUtils.spaceSmall,
                showOnOff: true,
                activeText: 'on'.tr,
                inactiveText: 'off'.tr,
                activeColor: Color(0xff457be4),
                disabled: model.isAuto,
                onToggle: (val) {
                  FunctionUtils.showSnackBar(
                      'Cảnh báo', 'Độ ẩm tưới tiêu vượt mức 85%');
                  widget.onChange?.call((val));
                  setState(() {});
                }),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              model.title!,
              style: TextStyle(
                  color: model.isEnable ? Colors.white : Color(0xff302e45),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          height: SpaceUtils.spaceSmall,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'auto'.tr,
              style: TextStyle(
                  color: model.isEnable ? Colors.white : Color(0xff302e45),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
            FlutterSwitch(
                width: 60.w,
                height: 35.h,
                valueFontSize: 16.sp,
                toggleSize: 16.w,
                value: model.isAuto,
                padding: SpaceUtils.spaceSmall,
                activeText: 'on'.tr,
                inactiveText: 'off'.tr,
                activeColor: Color(0xff457be4),
                onToggle: (val) {
                  widget.changeAutoStatus?.call(val);
                  setState(() {});
                })
          ],
        )
        // Icon(model.topRightIcon,color:model.isEnable ? Colors.white : Color(0xffa3a3a3))
      ],
    );
  }

  Widget _buildAddIcon() {
    return IconButton(
      icon: Icon(
        Icons.add,
        size: HeightUtils.iconSizeLarge,
      ),
      color: ColorUtils.primaryColor,
      onPressed: () {
        print('call api add device');
      },
    );
  }
}
