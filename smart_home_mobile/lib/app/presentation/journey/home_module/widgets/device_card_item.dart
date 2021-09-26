import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_mobile/app/domain/entities/appliance.dart';
import 'package:smart_home_mobile/scopedModel/connectedModel.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    required this.model, required this.onChange,
  }) : super(key: key);

  final Device model;
  final Function(bool) onChange;
  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  color: widget.model.isEnable
                      ? Colors.white
                      : Color(0xffa3a3a3)),
              CupertinoSwitch(
                value: widget.model.isEnable,
                activeColor: Color(0xff457be4),
                onChanged: (_) {
                  //todo impl
                  widget.model.isEnable =
                      !widget.model.isEnable;
                  setState(() {
                  });
                  widget.onChange(widget.model.isEnable);
                },
              ),
            ],
          ),
          SizedBox(
            height: 46,
          ),
          Text(
            widget.model.title!,
            style: TextStyle(
                color: widget.model.isEnable
                    ? Colors.white
                    : Color(0xff302e45),
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          Text(
            widget.model.subtitle!,
            style: TextStyle(
                color: widget.model.isEnable
                    ? Colors.white
                    : Color(0xffa3a3a3),
                fontSize: 20),
          ),
          // Icon(model.topRightIcon,color:model.isEnable ? Colors.white : Color(0xffa3a3a3))
        ],
      ),
    );
  }
}
