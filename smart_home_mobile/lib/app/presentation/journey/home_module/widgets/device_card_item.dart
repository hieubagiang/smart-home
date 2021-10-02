import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home_mobile/app/common/base/base_view_view_model.dart';
import 'package:smart_home_mobile/app/common/constants/colors_constant.dart';
import 'package:smart_home_mobile/app/common/constants/layout_constant.dart';
import 'package:smart_home_mobile/app/common/utils/styles.dart';
import 'package:smart_home_mobile/app/domain/entities/appliance.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    required this.model,
    required this.onChange,
    required this.changeAutoStatus,
  }) : super(key: key);

  final Device model;
  final Function(bool) onChange;
  final Function(bool) changeAutoStatus;

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(
          horizontal: SpaceUtils.spaceSmall, vertical: SpaceUtils.spaceSmall),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 10, offset: Offset(0, 10), color: Color(0xfff1f0f2))
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.model.isEnable
                  ? [Color(0xff669df4), Color(0xff4e80f3)]
                  : [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(widget.model.leftIcon,
                  color:
                      widget.model.isEnable ? Colors.white : Color(0xffa3a3a3)),
              FlutterSwitch(
                  width: 70.w,
                  height: 35.h,
                  valueFontSize: 16.sp,
                  toggleSize: 20.w,
                  value: widget.model.isEnable,
                  padding: SpaceUtils.spaceSmall,
                  showOnOff: true,
                  activeColor: Color(0xff457be4),
                  disabled: widget.model.isAuto,
                  onToggle: (val) {
                    print('test1: $val');
                    widget.onChange(val);
                    setState(() {
                    });
                  }),
            ],
          ),
          SizedBox(
            height: SpaceUtils.spaceLarge,
          ),
          Text(
            widget.model.title!,
            style: TextStyle(
                color: widget.model.isEnable ? Colors.white : Color(0xff302e45),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: SpaceUtils.spaceSmall,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Auto',
                style: TextStyle(
                    color: widget.model.isEnable ? Colors.white : Color(0xff302e45),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              FlutterSwitch(
                  width: 70.w,
                  height: 35.h,
                  valueFontSize: 16.sp,
                  toggleSize: 20.w,
                  value: widget.model.isAuto,
                  padding: SpaceUtils.spaceSmall,
                  activeColor: Color(0xff457be4),
                  onToggle: (val) {
                    widget.changeAutoStatus(val);
                    setState(() {
                    });
                  })
            ],
          )
          // Icon(model.topRightIcon,color:model.isEnable ? Colors.white : Color(0xffa3a3a3))
        ],
      ),
    );
  }
}
